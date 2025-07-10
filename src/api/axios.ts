import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:5189/api', // Update to match your backend
  headers: {
    'Content-Type': 'application/json'
  }
});

export default api;
