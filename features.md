# ✨ Vocabulary — Senarai Fitur Lengkap

> **Dokumen Fitur mengikut Fasa**
> Setiap fitur ada ID unik, status, dan dependency.

---

## Fasa 1 — MVP (Core Quiz + Auth + Subscription)

### 1. Auth System

| ID   | Fitur                            | Status | Catatan                                    |
| ---- | -------------------------------- | ------ | ------------------------------------------ |
| F1.1 | Register (nama, email, password) | ⬜     | Form Request validation, BM error messages |
| F1.2 | Login                            | ⬜     | Token-based (Sanctum)                      |
| F1.3 | Logout                           | ⬜     | Revoke current token                       |
| F1.4 | User Profile (get/update)        | ⬜     | Nama, email, password                      |

### 2. Quiz Engine (Core Loop)

| ID   | Fitur                         | Status | Catatan                              |
| ---- | ----------------------------- | ------ | ------------------------------------ |
| F2.1 | Start Quiz (20 ayat rawak)    | ⬜     | Cipta session, return soalan pertama |
| F2.2 | Hantar Jawapan                | ⬜     | Banding jawapan user vs target_text  |
| F2.3 | Bagi Jawapan (Reveal)         | ⬜     | Tunjuk correct answer                |
| F2.4 | Soalan Seterusnya             | ⬜     | Ambil soalan dari session            |
| F2.5 | Complete Session (Dah Hafal)  | ⬜     | Kira skor, unlock level seterusnya   |
| F2.6 | Review / Repeat (Belum Hafal) | ⬜     | Repeat ayat yg salah                 |
| F2.7 | Results Breakdown             | ⬜     | Markah + per-soalan review           |

### 3. Admin CRUD

| ID   | Fitur                          | Status | Catatan                                             |
| ---- | ------------------------------ | ------ | --------------------------------------------------- |
| F3.1 | Admin: Languages CRUD          | ⬜     | Code, name, flag, is_active                         |
| F3.2 | Admin: Levels CRUD             | ⬜     | Order, name (nested under language)                 |
| F3.3 | Admin: Sentences CRUD          | ⬜     | Source, target, tags, difficulty, order             |
| F3.4 | Admin: Subscription Plans CRUD | ⬜     | Name, slug, price_myr, stripe_price_id, is_active   |
| F3.5 | Admin: Coupons CRUD + Generate | ⬜     | Code generator, discount_percent=100, duration_days |
| F3.6 | Admin: Users List              | ⬜     | Lihat users, update role                            |
| F3.7 | Admin: Transactions List       | ⬜     | Lihat semua transaksi                               |
| F3.8 | Admin: Dashboard Stats         | ⬜     | Total users, active subs, revenue                   |

### 4. Subscription & Payment

| ID   | Fitur                   | Status | Catatan                                                            |
| ---- | ----------------------- | ------ | ------------------------------------------------------------------ |
| F4.1 | Stripe Checkout Session | ⬜     | Cipta checkout URL                                                 |
| F4.2 | Stripe Webhook Handler  | ⬜     | checkout.session.completed, invoice.paid, sub.updated, sub.deleted |
| F4.3 | Auto-Renew Toggle       | ⬜     | On/off auto_billing                                                |
| F4.4 | Subscription Status API | ⬜     | Current plan, status, end date                                     |
| F4.5 | Coupon Redemption API   | ⬜     | Validate + redeem coupon code                                      |
| F4.6 | Middleware: Subscribed  | ⬜     | Protect quiz routes                                                |
| F4.7 | Middleware: Admin       | ⬜     | Protect admin routes                                               |

### 5. User Dashboard

| ID   | Fitur                     | Status | Catatan                           |
| ---- | ------------------------- | ------ | --------------------------------- |
| F5.1 | Dashboard API             | ⬜     | Progress, streak, unlocked levels |
| F5.2 | Languages List (public)   | ⬜     | Hanya bahasa aktif                |
| F5.3 | Levels List (by language) | ⬜     | Filtered by access                |

---

## Fasa 2 — Polish & Admin Panel UI

### 6. Admin Frontend

| ID   | Fitur                   | Status | Catatan                    |
| ---- | ----------------------- | ------ | -------------------------- |
| F6.1 | Admin Layout (sidebar)  | ⬜     | Navigasi admin             |
| F6.2 | Languages Management UI | ⬜     | Table + form               |
| F6.3 | Levels Management UI    | ⬜     | Filter by language         |
| F6.4 | Sentences Management UI | ⬜     | Filter by level + language |
| F6.5 | Plans Management UI     | ⬜     | CRUD + set as active       |
| F6.6 | Coupons Management UI   | ⬜     | Generate + list            |
| F6.7 | Users List UI           | ⬜     | Table dengan role filter   |
| F6.8 | Transactions List UI    | ⬜     | Table dengan search        |

### 7. Quiz Experience Enhancement

| ID   | Fitur                            | Status | Catatan                     |
| ---- | -------------------------------- | ------ | --------------------------- |
| F7.1 | Answer comparison (citext, trim) | ⬜     | Tolerance untuk minor typos |
| F7.2 | Confetti on "Dah Hafal"          | ⬜     | Celebration effect          |
| F7.3 | Progress bar animation           | ⬜     | Smooth x/20 progress        |
| F7.4 | Streak tracking                  | ⬜     | Daily streak calculation    |

### 8. Subscription UI

| ID   | Fitur                        | Status | Catatan                           |
| ---- | ---------------------------- | ------ | --------------------------------- |
| F8.1 | Pricing Page from API        | ⬜     | Dynamic price display             |
| F8.2 | Subscription Management Page | ⬜     | Status, auto-renew toggle, cancel |
| F8.3 | Coupon Redemption UI (modal) | ⬜     | Enter code + validate             |
| F8.4 | Stripe Checkout redirect     | ⬜     | Redirect to Stripe, handle return |

---

## Fasa 3 — Multi-Language & Testing

### 9. Multi-Language Support

| ID   | Fitur                      | Status | Catatan                        |
| ---- | -------------------------- | ------ | ------------------------------ |
| F9.1 | German language seed data  | ⬜     | 20 ayat per level              |
| F9.2 | Language selector          | ⬜     | Choose language from dashboard |
| F9.3 | Language-specific progress | ⬜     | Track per language             |

### 10. Testing

| ID    | Fitur                       | Status | Catatan                         |
| ----- | --------------------------- | ------ | ------------------------------- |
| F10.1 | Unit Tests: Auth            | ⬜     | Register, login, logout         |
| F10.2 | Unit Tests: Quiz Engine     | ⬜     | Start, answer, complete, review |
| F10.3 | Unit Tests: Coupon System   | ⬜     | Validate, redeem, expiry        |
| F10.4 | Unit Tests: Stripe Webhooks | ⬜     | Handle all events               |
| F10.5 | Feature Tests: Admin CRUD   | ⬜     | All admin endpoints             |
| F10.6 | Security Audit              | ⬜     | CSRF, XSS, SQLi, OLAC           |

---

## Legend

- ⬜ = Belum mula
- 🔄 = Dalam proses
- ✅ = Selesai
- ❌ = Blocked / dibatalkan
