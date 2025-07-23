// components/NewPatientsChart.tsx
import { useEffect, useState } from 'react';
import axios from '../api/axios';
import { LineChart, Line, XAxis, YAxis, Tooltip, CartesianGrid, ResponsiveContainer } from 'recharts';

export default function NewPatientsChart() {
  const [data, setData] = useState<{ Date: string; Count: number }[]>([]);

  useEffect(() => {
    const fetchData = async () => {
      const token = localStorage.getItem('token');
      const res = await axios.get('http://localhost:5189/api/Patient/registrations/last7days', {
        headers: { Authorization: `Bearer ${token}` }
      });
      setData(res.data);
    };
    fetchData();
  }, []);

  return (
    <div>
      <h3 className="text-lg font-semibold mt-6 mb-2">New Patients (Last 7 Days)</h3>
      <ResponsiveContainer width="100%" height={300}>
        <LineChart data={data}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="Date" />
          <YAxis allowDecimals={false} />
          <Tooltip />
          <Line type="monotone" dataKey="Count" stroke="#2563eb" strokeWidth={2} />
        </LineChart>
      </ResponsiveContainer>
    </div>
  );
}
