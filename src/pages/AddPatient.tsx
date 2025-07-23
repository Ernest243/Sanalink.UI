import { useState } from 'react';
import axios from '../api/axios';

export default function AddPatient() {
  const [form, setForm] = useState({
    firstName: '',
    lastName: '',
    dateOfBirth: '',
    gender: '',
  });

  const [success, setSuccess] = useState(false);
  const [error, setError] = useState('');

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async () => {
    try {
      setSuccess(false);
      setError('');

      const token = localStorage.getItem('token'); // or however you store it

      await axios.post('/Patient', form, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      setSuccess(true);
      setForm({
        firstName: '',
        lastName: '',
        dateOfBirth: '',
        gender: '',
      });
    } catch (err) {
      setError('Error creating patient');
    }
  };

  return (
    <div className="p-4">
      <h2 className="text-xl font-semibold mb-4">Add New Patient</h2>

      <div className="space-y-4 max-w-md">
        <input
          type="text"
          name="firstName"
          placeholder="First Name"
          value={form.firstName}
          onChange={handleChange}
          className="border p-2 w-full"
        />
        <input
          type="text"
          name="lastName"
          placeholder="Last Name"
          value={form.lastName}
          onChange={handleChange}
          className="border p-2 w-full"
        />
        <input
          type="date"
          name="dateOfBirth"
          value={form.dateOfBirth}
          onChange={handleChange}
          className="border p-2 w-full"
        />
        <select
          name="gender"
          value={form.gender}
          onChange={handleChange}
          className="border p-2 w-full"
        >
          <option value="">Select Gender</option>
          <option value="Male">Male</option>
          <option value="Female">Female</option>
        </select>

        <button onClick={handleSubmit} className="bg-blue-600 text-white p-2 rounded">
          Add Patient
        </button>

        {success && <p className="text-green-600">Patient added successfully.</p>}
        {error && <p className="text-red-600">{error}</p>}
      </div>
    </div>
  );
}
