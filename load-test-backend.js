import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '15s', target: 150 }, // Ramp up to 150 users
    { duration: '30s', target: 150 }, // Stay at 150 users for 30s
    { duration: '15s', target: 0 },   // Ramp down
  ],
  thresholds: {
    http_req_duration: ['p(95)<2000'], // Allow higher latency for PHP backend
    http_req_failed: ['rate<0.05'],    // Allow under 5% failure
  },
};

const BASE_URL = 'http://host.docker.internal:80';

export default function () {
  // Test only Laravel API backend
  let res = http.get(`${BASE_URL}/api/plans`, {
    headers: { 'Accept': 'application/json' }
  });
  check(res, {
    'Backend API Plans status is 200': (r) => r.status === 200,
  });
  sleep(0.5); // Fast requests
}
