import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '30s', target: 20 }, // Ramp-up to 20 users
    { duration: '1m', target: 20 },  // Sustained load of 20 users
    { duration: '10s', target: 0 },  // Ramp-down to 0 users
  ],
  thresholds: {
    http_req_duration: ['p(95)<500'], // 95% of requests must complete under 500ms
  },
};

const BASE_URL = __ENV.API_URL || 'http://localhost/api';

export default function () {
  // 1. Get public subscription plans
  const plansRes = http.get(`${BASE_URL}/plans`);
  check(plansRes, {
    'plans list response is 200': (r) => r.status === 200,
  });

  // 2. Get active languages list
  const langRes = http.get(`${BASE_URL}/languages`);
  check(langRes, {
    'languages list response is 200': (r) => r.status === 200,
  });

  sleep(1);

  // 3. Attempt credentials login
  const loginPayload = JSON.stringify({
    email: 'admin@vocabulary.com',
    password: 'password', // Default seeded admin password
    'cf-turnstile-response': '1x00000000000000000000AA', // Passes turnstile local validation
  });

  const headers = {
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  };

  const loginRes = http.post(`${BASE_URL}/login`, loginPayload, headers);
  const loginSuccess = check(loginRes, {
    'login status is 200': (r) => r.status === 200,
  });

  if (loginSuccess) {
    const token = loginRes.json('token');
    const authHeaders = {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': `Bearer ${token}`,
      },
    };

    // 4. Fetch authenticated user profile
    const profileRes = http.get(`${BASE_URL}/me`, authHeaders);
    check(profileRes, {
      'profile status is 200': (r) => r.status === 200,
    });

    // 5. Fetch user dashboard stats
    const dashboardRes = http.get(`${BASE_URL}/dashboard`, authHeaders);
    check(dashboardRes, {
      'dashboard stats status is 200': (r) => r.status === 200,
    });
  }

  sleep(1);
}
