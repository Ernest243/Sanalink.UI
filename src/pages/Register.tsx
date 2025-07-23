import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import api from '../api/axios';

const Register = () => {
  const [formData, setFormData] = useState({
    fullName: '',
    email: '',
    password: '',
    role: '',
    department: ''
  });
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleRegister = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');

    try {
      await api.post('/Auth/register', formData);
      navigate('/login');
    } catch (err: any) {
      setError(err.response?.data?.message || 'Registration failed');
    }
  };

  return (
    <div className="flex min-h-screen">
      {/* Left Side Form */}
      <div className="flex-1 flex flex-col justify-center px-8 py-12 sm:px-16 bg-white">
        <div className="max-w-md w-full mx-auto">
          <h1 className="text-2xl font-bold mb-2 text-gray-900">Get started for free</h1>
          <p className="text-sm text-gray-600 mb-6">
            Already registered?{' '}
            <Link to="/login" className="text-blue-600 hover:underline">
              Sign in
            </Link>
          </p>

          <form className="space-y-4" onSubmit={handleRegister}>
            <input
              name="fullName"
              placeholder="Full name"
              className="w-full border rounded px-4 py-2"
              value={formData.fullName}
              onChange={handleChange}
            />
            <input
              name="email"
              type="email"
              placeholder="Email address"
              className="w-full border rounded px-4 py-2"
              value={formData.email}
              onChange={handleChange}
            />
            <input
              name="password"
              type="password"
              placeholder="Password"
              className="w-full border rounded px-4 py-2"
              value={formData.password}
              onChange={handleChange}
            />
            <input
              name="role"
              placeholder="Role (e.g. Doctor, Nurse)"
              className="w-full border rounded px-4 py-2"
              value={formData.role}
              onChange={handleChange}
            />
            <input
              name="department"
              placeholder="Department"
              className="w-full border rounded px-4 py-2"
              value={formData.department}
              onChange={handleChange}
            />

            {error && <p className="text-red-500 text-sm">{error}</p>}

            <button
              type="submit"
              className="w-full bg-blue-600 text-white rounded py-2 hover:bg-blue-700 transition"
            >
              Sign up →
            </button>
          </form>
        </div>
      </div>

      {/* Right Side Gradient */}
      <div className="hidden lg:block flex-1 bg-gradient-to-br from-blue-600 via-purple-500 to-blue-300" />
    </div>
  );
};

export default Register;
