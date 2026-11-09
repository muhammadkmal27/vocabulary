<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Mail\BroadcastEmail;
use App\Models\EmailBroadcast;
use App\Models\User;
use App\Models\Subscription;
use App\Models\CouponRedemption;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class EmailBroadcastController extends Controller
{
    /**
     * Helper to get all user IDs with active paid access (Stripe, ToyyibPay, or Coupon).
     */
    protected function getPaidUserIds()
    {
        $fromSubs = Subscription::where('stripe_status', 'active')
            ->where(function ($q) {
                $q->whereNull('ends_at')->orWhere('ends_at', '>', now());
            })
            ->pluck('user_id');

        $fromCoupons = CouponRedemption::whereHas('coupon', fn($q) => $q->where('is_active', true))
            ->pluck('user_id');

        return $fromSubs->concat($fromCoupons)->unique();
    }

    /**
     * Get users available as email recipients with filtering.
     */
    public function recipients(Request $request): JsonResponse
    {
        $search = $request->query('search');
        $filter = $request->query('filter', 'all'); // all, subscribed, free
        $paidUserIds = $this->getPaidUserIds();

        $query = User::select('id', 'name', 'email', 'role', 'created_at')
            ->whereNotNull('email')
            ->where('email', '!=', '')
            ->latest();

        if ($search) {
            $searchLower = strtolower($search);
            $query->where(function ($q) use ($searchLower) {
                $q->whereRaw('LOWER(name) LIKE ?', ["%{$searchLower}%"])
                  ->orWhereRaw('LOWER(email) LIKE ?', ["%{$searchLower}%"]);
            });
        }

        if ($filter === 'subscribed') {
            $query->whereIn('id', $paidUserIds);
        } elseif ($filter === 'free') {
            $query->whereNotIn('id', $paidUserIds);
        }

        $users = $query->limit(500)->get();

        $totalAll = User::whereNotNull('email')->where('email', '!=', '')->count();
        $totalPaid = User::whereIn('id', $paidUserIds)->whereNotNull('email')->where('email', '!=', '')->count();
        $totalFree = max(0, $totalAll - $totalPaid);

        return response()->json([
            'total'      => $users->count(),
            'total_all'  => $totalAll,
            'total_paid' => $totalPaid,
            'total_free' => $totalFree,
            'users'      => $users,
        ]);
    }

    /**
     * Broadcast email to all users or selected users.
     */
    public function send(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'subject'        => 'required|string|min:3|max:255',
            'body'           => 'required|string|min:5',
            'recipient_type' => 'required|in:all,selected,subscribed,free,test',
            'user_ids'       => 'required_if:recipient_type,selected|array',
            'user_ids.*'     => 'uuid|exists:users,id',
            'test_email'     => 'nullable|email|max:255',
        ], [
            'subject.required'        => 'Sila masukkan subjek emel.',
            'body.required'           => 'Sila masukkan kandungan emel.',
            'recipient_type.required' => 'Sila pilih jenis penerima emel.',
            'user_ids.required_if'    => 'Sila pilih sekurang-kurangnya seorang penerima.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->errors()->first(),
                'errors'  => $validator->errors(),
            ], 422);
        }

        $recipientType = $request->input('recipient_type');
        $subject = trim($request->input('subject'));
        $body = trim($request->input('body'));

        // Prevent timeout for bulk mail processing
        set_time_limit(600);
        ignore_user_abort(true);

        $recipients = collect();

        if ($recipientType === 'test') {
            $testEmail = $request->input('test_email', 'saashouse.mail@gmail.com') ?: 'saashouse.mail@gmail.com';
            $recipients->push((object) [
                'name'  => 'Admin Test',
                'email' => $testEmail,
            ]);
        } elseif ($recipientType === 'selected') {
            $userIds = $request->input('user_ids', []);
            $recipients = User::whereIn('id', $userIds)
                ->whereNotNull('email')
                ->where('email', '!=', '')
                ->get();
        } elseif ($recipientType === 'subscribed') {
            $paidUserIds = $this->getPaidUserIds();
            $recipients = User::whereIn('id', $paidUserIds)
                ->whereNotNull('email')
                ->where('email', '!=', '')
                ->get();
        } elseif ($recipientType === 'free') {
            $paidUserIds = $this->getPaidUserIds();
            $recipients = User::whereNotIn('id', $paidUserIds)
                ->whereNotNull('email')
                ->where('email', '!=', '')
                ->get();
        } else {
            // All users
            $recipients = User::whereNotNull('email')
                ->where('email', '!=', '')
                ->get();
        }

        if ($recipients->isEmpty()) {
            return response()->json([
                'message' => 'Tiada penerima dijumpai untuk kriteria yang dipilih.',
            ], 422);
        }

        $sentCount = 0;
        $failedCount = 0;
        $failedEmails = [];

        foreach ($recipients as $recipient) {
            try {
                $subjectToSend = $recipientType === 'test'
                    ? $subject . ' [Ujian ' . now()->format('h:i A') . ']'
                    : $subject;

                Mail::to($recipient->email)->send(
                    new BroadcastEmail($subjectToSend, $body, $recipient->name ?? null)
                );
                $sentCount++;
            } catch (\Throwable $e) {
                $failedCount++;
                $failedEmails[] = $recipient->email;
                Log::error("Gagal menghantar emel broadcast ke {$recipient->email}: " . $e->getMessage());
            }
        }

        // Save broadcast record into database
        $status = $failedCount === 0 ? 'completed' : ($sentCount > 0 ? 'partial' : 'failed');
        $broadcast = EmailBroadcast::create([
            'sender_email'     => 'saashouse.mail@gmail.com',
            'subject'          => $subject,
            'body'             => $body,
            'recipient_type'   => $recipientType,
            'total_recipients' => $recipients->count(),
            'sent_count'       => $sentCount,
            'failed_count'     => $failedCount,
            'status'           => $status,
            'notes'            => count($failedEmails) > 0 ? 'Gagal: ' . implode(', ', array_slice($failedEmails, 0, 10)) : null,
        ]);

        return response()->json([
            'message'          => "Penghantaran emel selesai. Berjaya: {$sentCount}, Gagal: {$failedCount}.",
            'total_recipients' => $recipients->count(),
            'sent_count'       => $sentCount,
            'failed_count'     => $failedCount,
            'broadcast'        => $broadcast,
        ]);
    }

    /**
     * Get broadcast history.
     */
    public function history(): JsonResponse
    {
        $history = EmailBroadcast::latest()->limit(30)->get();

        return response()->json($history);
    }
}
