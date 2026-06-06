<?php

namespace App\Services;

use App\Models\Subscription;
use App\Models\SubscriptionPlan;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class ToyyibPayService
{
    public function createBill(User $user, string $successUrl): string
    {
        $plan = SubscriptionPlan::where('slug', 'lifetime')->first();
        if (!$plan) {
            throw new \Exception("Pelan promosi tidak dijumpai.");
        }

        $limit = $plan->member_limit ?? 100;
        $count = Subscription::where('payment_gateway', 'toyyibpay')
            ->where('stripe_status', 'active')
            ->count();

        if ($count >= $limit) {
            throw new \Exception("Kuota promosi ({$limit} pengguna) telah dicapai sepenuhnya.");
        }

        $url = config('toyyibpay.url') . 'index.php/api/createBill';
        
        // Tukar harga (RM) ke sen untuk ToyyibPay. Contoh: RM1.00 -> 100 sen
        $billAmount = (int) round(floatval($plan->price_myr) * 100);

        $params = [
            'userSecretKey' => config('toyyibpay.secret_key'),
            'categoryCode' => config('toyyibpay.category_code'),
            'billName' => $plan->name,
            'billDescription' => 'Vocabulary Premium Access - ' . $plan->name,
            'billPriceSetting' => 1,
            'billPayorInfo' => 1,
            'billAmount' => $billAmount, 
            'billReturnUrl' => $successUrl,
            'billCallbackUrl' => url('/api/subscription/toyyibpay/webhook'),
            'billExternalReferenceNo' => $user->id,
            'billTo' => $user->name,
            'billEmail' => $user->email,
            'billPhone' => '01111111111',
        ];

        $response = Http::asForm()->post($url, $params);

        if (!$response->successful()) {
            Log::error("ToyyibPay API Connection Error", ['response' => $response->body()]);
            throw new \Exception("Gagal menghubungi ToyyibPay.");
        }

        $data = $response->json();
        
        if (is_array($data) && isset($data[0]['BillCode'])) {
            return config('toyyibpay.url') . $data[0]['BillCode'];
        }

        Log::error("ToyyibPay Response Error", ['data' => $data]);
        throw new \Exception("ToyyibPay gagal menjana bil.");
    }

    public function handleWebhook(array $data): void
    {
        $status = $data['status'] ?? null;
        $userId = $data['billExternalReferenceNo'] ?? null;
        $amount = $data['amount'] ?? 1.00;
        $refno = $data['refno'] ?? '';
        $billcode = $data['billcode'] ?? null;

        // Verify transaction with ToyyibPay API to prevent spoofing
        if (!app()->environment('testing')) {
            if (!$billcode) {
                Log::error("ToyyibPay Webhook missing billcode");
                return;
            }
            
            $verifyUrl = config('toyyibpay.url') . 'index.php/api/getBillTransactions';
            $verifyResponse = Http::asForm()->post($verifyUrl, [
                'billCode' => $billcode,
                'userSecretKey' => config('toyyibpay.secret_key'),
            ]);
            
            if (!$verifyResponse->successful()) {
                Log::error("ToyyibPay Webhook Verification Connection Error");
                return;
            }
            
            $transactions = $verifyResponse->json();
            $isValid = false;
            if (is_array($transactions)) {
                foreach ($transactions as $tx) {
                    if (($tx['billpaymentStatus'] ?? null) == '1' && ($tx['billpaymentSettlementRefNo'] ?? null) == $refno) {
                        $isValid = true;
                        break;
                    }
                }
            }
            
            if (!$isValid) {
                Log::error("ToyyibPay Webhook Verification Failed: Transaction not found or unpaid", ['refno' => $refno]);
                return;
            }
        }

        // status = 1 is Success in ToyyibPay
        if ($status == 1 && $userId) {
            $this->activateSubscription($userId, $refno, $amount);
        }
    }

    /**
     * Verify payment when user returns from ToyyibPay redirect (return URL).
     * This is essential because ToyyibPay's webhook cannot reach localhost during development.
     * Even in production, this provides a fallback if the webhook fails/delays.
     */
    public function verifyReturnPayment(User $user, string $billcode): array
    {
        // Check if already activated (idempotent)
        $existing = Subscription::where('user_id', $user->id)
            ->where('payment_gateway', 'toyyibpay')
            ->where('stripe_status', 'active')
            ->first();

        if ($existing) {
            return ['activated' => true, 'message' => 'Langganan anda sudah aktif.'];
        }

        // Verify with ToyyibPay API
        $verifyUrl = config('toyyibpay.url') . 'index.php/api/getBillTransactions';
        $verifyResponse = Http::asForm()->post($verifyUrl, [
            'billCode' => $billcode,
            'userSecretKey' => config('toyyibpay.secret_key'),
        ]);

        if (!$verifyResponse->successful()) {
            Log::error("ToyyibPay Return Verification Connection Error", ['billcode' => $billcode]);
            return ['activated' => false, 'message' => 'Gagal mengesahkan pembayaran dengan ToyyibPay.'];
        }

        $transactions = $verifyResponse->json();

        if (!is_array($transactions) || empty($transactions)) {
            Log::error("ToyyibPay Return Verification: No transactions found", ['billcode' => $billcode]);
            return ['activated' => false, 'message' => 'Tiada transaksi dijumpai untuk bil ini.'];
        }

        // Find a successful paid transaction belonging to this user
        $paidTx = null;
        foreach ($transactions as $tx) {
            $txStatus = $tx['billpaymentStatus'] ?? null;
            $txExternalRef = $tx['billExternalReferenceNo'] ?? null;

            if ($txStatus == '1' && $txExternalRef === $user->id) {
                $paidTx = $tx;
                break;
            }
        }

        if (!$paidTx) {
            Log::warning("ToyyibPay Return Verification: No paid transaction for user", [
                'user_id' => $user->id,
                'billcode' => $billcode,
            ]);
            return ['activated' => false, 'message' => 'Pembayaran belum berjaya atau tidak sepadan.'];
        }

        $refno = $paidTx['billpaymentSettlementRefNo'] ?? $paidTx['billpaymentInvoiceNo'] ?? $billcode;
        $amount = (float) ($paidTx['billpaymentAmount'] ?? 1.00);

        $this->activateSubscription($user->id, $refno, $amount);

        return ['activated' => true, 'message' => 'Tahniah! Langganan anda telah berjaya diaktifkan.'];
    }

    /**
     * Shared logic to activate a subscription (used by both webhook and return verification).
     */
    private function activateSubscription(string $userId, string $refno, float $amount): void
    {
        $user = User::find($userId);
        if (!$user) {
            Log::error("ToyyibPay User not found", ['user_id' => $userId]);
            return;
        }

        \Illuminate\Support\Facades\DB::transaction(function () use ($user, $refno, $amount) {
            // Find or create promo plan (use fallback if not in DB)
            $plan = SubscriptionPlan::where('slug', 'lifetime')->first();
            if (!$plan) {
                $plan = SubscriptionPlan::create([
                    'slug' => 'lifetime',
                    'name' => 'Promo 1 Tahun',
                    'price_myr' => 1.00,
                    'duration_months' => 12,
                    'stripe_price_id' => null,
                    'is_active' => true,
                ]);
            }

            // Deactivate other existing subscriptions
            $user->subscriptions()->update(['stripe_status' => 'canceled', 'auto_renew' => false]);

            // Create active subscription based on duration_months
            $durationMonths = $plan->duration_months;
            $isLifetime = empty($durationMonths);
            $endsAt = $isLifetime ? null : now()->addMonths($durationMonths);

            $subscription = Subscription::updateOrCreate(
                [
                    'user_id' => $user->id,
                    'payment_gateway' => 'toyyibpay',
                ],
                [
                    'plan_id' => $plan->id,
                    'stripe_subscription_id' => 'toyyibpay_' . $refno,
                    'stripe_status' => 'active',
                    'auto_renew' => false,
                    'is_lifetime' => $isLifetime,
                    'ends_at' => $endsAt,
                ]
            );

            // Log transaction
            Transaction::updateOrCreate(
                ['stripe_invoice_id' => $refno],
                [
                    'user_id' => $user->id,
                    'subscription_id' => $subscription->id,
                    'payment_gateway' => 'toyyibpay',
                    'amount' => $amount,
                    'currency' => 'myr',
                    'status' => 'paid',
                    'paid_at' => now(),
                ]
            );
        });

        // Send Facebook CAPI Purchase event
        try {
            if ($user) {
                app(FacebookCapiService::class)->sendPurchaseEvent($user, $amount);
            }
        } catch (\Exception $e) {
            Log::error('Failed to trigger Facebook CAPI from ToyyibPay subscription activation', [
                'error' => $e->getMessage()
            ]);
        }

        Log::info("ToyyibPay subscription activated", ['user_id' => $userId, 'refno' => $refno]);
    }
}
