import { useEffect, useState } from 'react';
import axios from '../api/axios';

interface Appointment {
  id: number;
  patient: { id: number; firstName: string; lastName: string };
  doctor: { userName: string };
  date: string;
  reason: string;
  status: string;
}

export default function BookAppointment() {
  const [form, setForm] = useState({ patientId: '', date: '', reason: '' });
  const [patients, setPatients] = useState([]);
  const [appointments, setAppointments] = useState<Appointment[]>([]);
  const [statusFilter, setStatusFilter] = useState('');
  const [success, setSuccess] = useState(false);
  const [error, setError] = useState('');

  const [editModalOpen, setEditModalOpen] = useState(false);
  const [cancelModalOpen, setCancelModalOpen] = useState(false);
  const [selectedAppointment, setSelectedAppointment] = useState<Appointment | null>(null);
  const [editForm, setEditForm] = useState({ date: '', reason: '', status: 'Scheduled' });

  const token = localStorage.getItem('token');
  const doctorId = token ? JSON.parse(atob(token.split('.')[1]))['sub'] : '';

  useEffect(() => {
    fetchPatients();
    fetchAppointments();
  }, []);

  const fetchPatients = async () => {
    try {
      const res = await axios.get('http://localhost:5189/api/Patient', {
        headers: { Authorization: `Bearer ${token}` },
      });
      setPatients(res.data);
    } catch {
      setError('Failed to fetch patients');
    }
  };

  const fetchAppointments = async () => {
    try {
      const res = await axios.get('http://localhost:5189/api/Appointment', {
        headers: { Authorization: `Bearer ${token}` },
      });
      setAppointments(res.data);
    } catch {
      setError('Failed to fetch appointments');
    }
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement>) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async () => {
    try {
      setSuccess(false);
      setError('');
      await axios.post('http://localhost:5189/api/Appointment', {
        ...form,
        doctorId,
      }, {
        headers: { Authorization: `Bearer ${token}` }
      });

      setForm({ patientId: '', date: '', reason: '' });
      setSuccess(true);
      fetchAppointments();
    } catch {
      setError('Error booking appointment');
    }
  };

  const openEditModal = (appt: Appointment) => {
    setSelectedAppointment(appt);
    setEditForm({
      date: appt.date.slice(0, 16),
      reason: appt.reason,
      status: appt.status,
    });
    setEditModalOpen(true);
  };

  const updateAppointment = async () => {
    if (!selectedAppointment) return;

    try {
      await axios.put(`http://localhost:5189/api/Appointment/${selectedAppointment.id}`, {
        ...selectedAppointment,
        ...editForm,
      }, {
        headers: { Authorization: `Bearer ${token}` }
      });

      setEditModalOpen(false);
      fetchAppointments();
    } catch {
      alert('Failed to update appointment');
    }
  };

  const openCancelModal = (appt: Appointment) => {
    setSelectedAppointment(appt);
    setCancelModalOpen(true);
  };

  const cancelAppointment = async () => {
    if (!selectedAppointment) return;

    try {
      await axios.delete(`http://localhost:5189/api/Appointment/${selectedAppointment.id}`, {
        headers: { Authorization: `Bearer ${token}` },
      });

      setCancelModalOpen(false);
      fetchAppointments();
    } catch {
      alert('Failed to cancel appointment');
    }
  };

  return (
    <div className="p-4">
      <h2 className="text-xl font-semibold mb-4">Book Appointment</h2>

      <div className="max-w-md mb-8 space-y-2">
        <select name="patientId" value={form.patientId} onChange={handleChange} className="border p-2 w-full">
          <option value="">Select Patient</option>
          {patients.map((p: any) => (
            <option key={p.id} value={p.id}>{p.firstName} {p.lastName}</option>
          ))}
        </select>

        <input
          type="datetime-local"
          name="date"
          value={form.date}
          onChange={handleChange}
          className="border p-2 w-full"
        />

        <textarea
          name="reason"
          placeholder="Reason for appointment"
          value={form.reason}
          onChange={handleChange}
          className="border p-2 w-full"
        />

        <button onClick={handleSubmit} className="bg-blue-600 text-white px-4 py-2 rounded">Book Appointment</button>
        {success && <p className="text-green-600">Appointment booked!</p>}
        {error && <p className="text-red-600">{error}</p>}
      </div>

      <hr className="my-6" />

      <h3 className="text-lg font-semibold mb-2">Upcoming Appointments</h3>

      <select onChange={(e) => setStatusFilter(e.target.value)} className="border p-2 mb-4">
        <option value="">All Statuses</option>
        <option value="Scheduled">Scheduled</option>
        <option value="Completed">Completed</option>
        <option value="Cancelled">Cancelled</option>
      </select>

      <div className="overflow-x-auto">
        <table className="min-w-full border">
          <thead>
            <tr className="bg-gray-100">
              <th className="px-4 py-2 border">Patient ID</th>
              <th className="px-4 py-2 border">Patient</th>
              <th className="px-4 py-2 border">Doctor</th>
              <th className="px-4 py-2 border">Date</th>
              <th className="px-4 py-2 border">Reason</th>
              <th className="px-4 py-2 border">Status</th>
              <th className="px-4 py-2 border">Actions</th>
            </tr>
          </thead>
          <tbody>
            {appointments
              .filter((a) => !statusFilter || a.status === statusFilter)
              .map((appt) => (
                <tr key={appt.id}>
                  <td className="border px-4 py-2">{appt.patient.id}</td>
                  <td className="border px-4 py-2">{appt.patient.firstName} {appt.patient.lastName}</td>
                  <td className="border px-4 py-2">{appt.doctor.userName}</td>
                  <td className="border px-4 py-2">{new Date(appt.date).toLocaleString()}</td>
                  <td className="border px-4 py-2">{appt.reason}</td>
                  <td className="border px-4 py-2">{appt.status}</td>
                  <td className="border px-4 py-2 flex gap-2">
                    <button onClick={() => openEditModal(appt)} className="text-blue-600 hover:underline">Edit</button>
                    <button onClick={() => openCancelModal(appt)} className="text-red-600 hover:underline">Cancel</button>
                  </td>
                </tr>
              ))}
          </tbody>
        </table>
      </div>

      {/* Edit Modal */}
      {editModalOpen && selectedAppointment && (
        <div className="fixed inset-0 bg-black bg-opacity-30 flex justify-center items-center z-50">
          <div className="bg-white p-6 rounded shadow-md w-full max-w-md">
            <h2 className="text-lg font-semibold mb-4">Edit Appointment</h2>

            <input
              type="datetime-local"
              name="date"
              value={editForm.date}
              onChange={(e) => setEditForm({ ...editForm, date: e.target.value })}
              className="border p-2 w-full mb-2"
            />
            <textarea
              name="reason"
              value={editForm.reason}
              onChange={(e) => setEditForm({ ...editForm, reason: e.target.value })}
              className="border p-2 w-full mb-2"
            />
            <select
              value={editForm.status}
              onChange={(e) => setEditForm({ ...editForm, status: e.target.value })}
              className="border p-2 w-full mb-4"
            >
              <option value="Scheduled">Scheduled</option>
              <option value="Completed">Completed</option>
              <option value="Cancelled">Cancelled</option>
            </select>

            <div className="flex justify-end gap-4">
              <button onClick={() => setEditModalOpen(false)} className="px-4 py-2">Cancel</button>
              <button onClick={updateAppointment} className="bg-blue-600 text-white px-4 py-2 rounded">Update</button>
            </div>
          </div>
        </div>
      )}

      {/* Cancel Confirmation Modal */}
      {cancelModalOpen && selectedAppointment && (
        <div className="fixed inset-0 bg-black bg-opacity-30 flex justify-center items-center z-50">
          <div className="bg-white p-6 rounded shadow-md w-full max-w-sm">
            <h2 className="text-lg font-semibold mb-4">Confirm Cancellation</h2>
            <p>Are you sure you want to cancel the appointment for <strong>{selectedAppointment.patient.firstName}</strong>?</p>
            <div className="flex justify-end gap-4 mt-4">
              <button onClick={() => setCancelModalOpen(false)} className="px-4 py-2">No</button>
              <button onClick={cancelAppointment} className="bg-red-600 text-white px-4 py-2 rounded">Yes, Cancel</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
