import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '15s', target: 150 }, // Ramp up to 150 users
    { duration: '30s', target: 150 }, // Stay at 150 users for 30s
    { duration: '15s', target: 0 },   // Ramp down
  ],
  thresholds: {
    http_req_duration: ['p(95)<1000'], // Expect frontend to be very fast (under 1s)
    http_req_failed: ['rate<0.01'],    // Under 1% failure
  },
};

const BASE_URL = 'http://host.docker.internal:80';

export default function () {
  // Test only Frontend pages
  let res = http.get(`${BASE_URL}/pricing`);
  check(res, {
    'Frontend Pricing status is 200': (r) => r.status === 200,
  });
  sleep(0.5); // Fast requests
}
