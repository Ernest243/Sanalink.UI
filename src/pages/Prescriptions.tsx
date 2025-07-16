import { useEffect, useState } from 'react';
import axios from 'axios';

interface Prescription {
  id: number;
  medicationName: string;
  dosage: string;
  instructions: string;
  doctorName: string;
  createdAt: string;
}

const Prescriptions = () => {
  const [prescriptions, setPrescriptions] = useState<Prescription[]>([]);
  const [patientId, setPatientId] = useState<number | ''>('');
  const [medicationName, setMedicationName] = useState('');
  const [dosage, setDosage] = useState('');
  const [instructions, setInstructions] = useState('');

  const fetchPrescriptions = async (id: number) => {
    try {
      const token = localStorage.getItem('token');
      const res = await axios.get(`http://localhost:5189/api/Prescriptions/patient/${id}`, {
        headers: { Authorization: `Bearer ${token}` },
      });
      setPrescriptions(Array.isArray(res.data) ? res.data : []);
    } catch (err) {
      console.error('Error fetching prescriptions:', err);
      setPrescriptions([]);
    }
  };

  useEffect(() => {
    if (patientId && !isNaN(Number(patientId))) {
      fetchPrescriptions(Number(patientId));
    } else {
      setPrescriptions([]);
    }
  }, [patientId]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!patientId) return;

    try {
      const token = localStorage.getItem('token');
      await axios.post(
        'http://localhost:5189/api/Prescriptions',
        { patientId, medicationName, dosage, instructions },
        {
          headers: { Authorization: `Bearer ${token}` },
        }
      );
      setMedicationName('');
      setDosage('');
      setInstructions('');
      await fetchPrescriptions(Number(patientId)); // Refresh list
    } catch (err) {
      console.error('Error creating prescription:', err);
    }
  };

  return (
    <div className="p-6 bg-white rounded shadow">
      <h2 className="text-xl font-bold mb-4">Prescriptions</h2>

      <form onSubmit={handleSubmit} className="mb-6 space-y-4">
        <div>
          <label className="block mb-1 font-medium">Patient ID</label>
          <input
            type="number"
            value={patientId}
            onChange={(e) => setPatientId(Number(e.target.value))}
            className="w-full border px-3 py-2 rounded"
            required
          />
        </div>
        <div>
          <label className="block mb-1 font-medium">Medication Name</label>
          <input
            value={medicationName}
            onChange={(e) => setMedicationName(e.target.value)}
            className="w-full border px-3 py-2 rounded"
            required
          />
        </div>
        <div>
          <label className="block mb-1 font-medium">Dosage</label>
          <input
            value={dosage}
            onChange={(e) => setDosage(e.target.value)}
            className="w-full border px-3 py-2 rounded"
            required
          />
        </div>
        <div>
          <label className="block mb-1 font-medium">Instructions</label>
          <textarea
            value={instructions}
            onChange={(e) => setInstructions(e.target.value)}
            className="w-full border px-3 py-2 rounded"
            required
          />
        </div>
        <button type="submit" className="px-4 py-2 bg-blue-600 text-white rounded">
          Add Prescription
        </button>
      </form>

      {prescriptions.length === 0 ? (
        <p>No prescriptions available yet.</p>
      ) : (
        <ul className="space-y-3">
          {prescriptions.map((p) => (
            <li key={p.id} id={`prescription-${p.id}`} className="p-6 max-w-md bg-white border rounded shadow space-y-2">
              <p><strong>Medication:</strong> {p.medicationName}</p>
              <p><strong>Dosage:</strong> {p.dosage}</p>
              <p><strong>Instructions:</strong> {p.instructions}</p>
              <p className="text-sm text-gray-600">
                Prescribed by {p.doctorName} on {new Date(p.createdAt).toLocaleString()}
              </p>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default Prescriptions;
