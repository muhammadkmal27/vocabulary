<?php
use App\Http\Controllers\Admin\CouponController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\LanguageController;
use App\Http\Controllers\Admin\LevelController;
use App\Http\Controllers\Admin\PlanController;
use App\Http\Controllers\Admin\SentenceController;
use App\Http\Controllers\Admin\TransactionController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\GoogleAuthController;
use App\Http\Controllers\Api\SubscriptionController;
use App\Http\Controllers\Api\WebhookController;
use App\Http\Controllers\Api\CouponController as ApiCouponController;
use Illuminate\Support\Facades\Route;

// Public
Route::get('/auth/google', [GoogleAuthController::class, 'redirect']);
Route::get('/auth/google/callback', [GoogleAuthController::class, 'callback']);

// Auth endpoints — Rate limited (Rule #21)
Route::middleware('throttle:auth')->group(function () {
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);
});

Route::get('/languages', [\App\Http\Controllers\Api\LanguageController::class, 'index']);
Route::get('/levels', [\App\Http\Controllers\Api\LevelController::class, 'index']);
Route::get('/dashboard', [\App\Http\Controllers\Api\DashboardController::class, 'index']);
Route::get('/public/levels/{levelId}/sentences', [\App\Http\Controllers\Api\QuizController::class, 'publicSentences']);
Route::get('/plans', function () {
    return \Illuminate\Support\Facades\Cache::remember('subscription_plans_active', 3600, function () {
        return \App\Models\SubscriptionPlan::where('is_active', true)->where('slug', '!=', 'lifetime')->get();
    });
});


// Dashboard & Profile (authenticated)
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/profile', [\App\Http\Controllers\Api\ProfileController::class, 'show']);
    Route::put('/profile', [\App\Http\Controllers\Api\ProfileController::class, 'update']);
    Route::put('/profile/password', [\App\Http\Controllers\Api\ProfileController::class, 'updatePassword']);
    Route::post('/quiz/start', [\App\Http\Controllers\Api\QuizController::class, 'start']);
    Route::post('/quiz/{sessionId}/answer', [\App\Http\Controllers\Api\QuizController::class, 'submitAnswer']);
    Route::post('/quiz/{sessionId}/reveal/{answerId}', [\App\Http\Controllers\Api\QuizController::class, 'reveal']);
    Route::post('/quiz/{sessionId}/complete', [\App\Http\Controllers\Api\QuizController::class, 'complete']);
    Route::get('/quiz/{sessionId}', [\App\Http\Controllers\Api\QuizController::class, 'show']);
    Route::get('/review/{languageId}/{levelId}', [\App\Http\Controllers\Api\QuizController::class, 'review']);
});

// Coupon — Rate limited (Rule #21)
Route::middleware('throttle:coupon')->group(function () {
    Route::post('/coupons/validate', [App\Http\Controllers\Api\CouponController::class, 'validate']);
});
Route::middleware(['auth:sanctum', 'throttle:coupon'])->group(function () {
    Route::post('/coupons/redeem', [App\Http\Controllers\Api\CouponController::class, 'redeem']);
    Route::get('/coupons/my-coupons', [App\Http\Controllers\Api\CouponController::class, 'myCoupons']);
});

// Stripe Webhook (public, no CSRF) — Rate limited to prevent abuse
Route::middleware('throttle:webhook')->group(function () {
    Route::post('/stripe/webhook', [App\Http\Controllers\Api\WebhookController::class, 'handle']);
});

// ToyyibPay Webhook (public, no CSRF) — Rate limited
Route::middleware('throttle:webhook')->group(function () {
    Route::post('/subscription/toyyibpay/webhook', [App\Http\Controllers\Api\ToyyibPayController::class, 'webhook']);
});

// Subscription — Payment creation endpoints (strict rate limit)
Route::middleware(['auth:sanctum', 'throttle:payment-create'])->group(function () {
    Route::post('/subscription/create-checkout', [App\Http\Controllers\Api\SubscriptionController::class, 'createCheckout']);
    Route::post('/subscription/stripe/verify-return', [App\Http\Controllers\Api\SubscriptionController::class, 'verifyReturn']);
    Route::post('/subscription/toyyibpay/create-bill', [App\Http\Controllers\Api\ToyyibPayController::class, 'createBill']);
    Route::post('/subscription/toyyibpay/verify-return', [App\Http\Controllers\Api\ToyyibPayController::class, 'verifyReturn']);
});

// Subscription — Management endpoints (moderate rate limit)
Route::middleware(['auth:sanctum', 'throttle:payment-manage'])->group(function () {
    Route::post('/subscription/toggle-renew', [App\Http\Controllers\Api\SubscriptionController::class, 'toggleRenew']);
    Route::get('/subscription/status', [App\Http\Controllers\Api\SubscriptionController::class, 'status']);
});

// Public ToyyibPay Promo status
Route::middleware('throttle:payment-manage')->get('/subscription/toyyibpay/status', [App\Http\Controllers\Api\ToyyibPayController::class, 'status']);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/user', [AuthController::class, 'me']);
});

// Admin (auth:sanctum + admin middleware)
Route::middleware(['auth:sanctum', 'admin'])->prefix('admin')->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index']);
    
    Route::apiResource('languages', LanguageController::class);
    Route::apiResource('languages.levels', LevelController::class)->shallow();
    Route::post('languages/{language}/levels/{level}/sentences/bulk', [SentenceController::class, 'bulkStore']);
    Route::apiResource('languages.levels.sentences', SentenceController::class)->shallow();
    
    Route::apiResource('plans', PlanController::class);
    
    Route::get('coupons', [CouponController::class, 'index']);
    Route::post('coupons', [CouponController::class, 'store']);
    Route::post('coupons/generate', [CouponController::class, 'generate']);
    Route::get('coupons/{coupon}', [CouponController::class, 'show']);
    Route::put('coupons/{coupon}', [CouponController::class, 'update']);
    Route::delete('coupons/{coupon}', [CouponController::class, 'destroy']);
    
    Route::get('users', [UserController::class, 'index']);
    Route::get('users/{user}', [UserController::class, 'show']);
    Route::put('users/{user}', [UserController::class, 'update']);
    
    Route::get('transactions', [TransactionController::class, 'index']);
    Route::get('transactions/{transaction}', [TransactionController::class, 'show']);
});
