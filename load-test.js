import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '30s', target: 50 }, // Ramp up to 50 users
    { duration: '1m', target: 50 },  // Stay at 50 users for 1 minute
    { duration: '30s', target: 0 },  // Ramp down to 0 users
  ],
  thresholds: {
    http_req_duration: ['p(95)<2000'], // 95% of requests should be below 2000ms (production realistic)
    http_req_failed: ['rate<0.05'],    // Error rate should be less than 5%
  },
};

// === PRODUCTION Docker Setup ===
// All requests go through Nginx gateway at port 80
// Nginx routes: / and /pricing → frontend-app:3000
//               /api/* → laravel-app:9000 (php-fpm via fastcgi)
const BASE_URL = 'http://host.docker.internal:80';

export default function () {
  // 1. Test Next.js Frontend Home Page (via Nginx → frontend-app)
  let res1 = http.get(`${BASE_URL}/`);
  check(res1, {
    'Home status is 200': (r) => r.status === 200,
  });

  sleep(1);

  // 2. Test Next.js Pricing Page (via Nginx → frontend-app)
  let res2 = http.get(`${BASE_URL}/pricing`);
  check(res2, {
    'Pricing status is 200': (r) => r.status === 200,
  });

  sleep(1);

  // 3. Test Laravel Backend API (via Nginx → laravel-app php-fpm)
  let res3 = http.get(`${BASE_URL}/api/plans`, {
    headers: {
      'Accept': 'application/json',
    },
  });
  check(res3, {
    'API Plans status is 200': (r) => r.status === 200,
  });

  sleep(1);
}
