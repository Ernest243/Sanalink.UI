import { useState } from 'react';
import axios from 'axios';

interface Note {
  id: number;
  content: string;
  doctorName: string;
  createdAt: string;
}

const Notes = () => {
  const [notes, setNotes] = useState<Note[]>([]);
  const [content, setContent] = useState('');
  const [patientId, setPatientId] = useState<number | ''>('');
  const [_error, setError] = useState('');

  const fetchNotes = async (id: number) => {
    try {
      const token = localStorage.getItem('token');
      const res = await axios.get(`http://localhost:5189/api/Notes/patient/${id}`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      // Ensure we only set an array
      if (Array.isArray(res.data)) {
        setNotes(res.data);
      } else {
        setNotes([]);
      }
    } catch (error) {
      console.error('Error fetching notes:', error);
      setNotes([]);
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!patientId) {
      setError('Patient ID is required');
      return;
    }

    try {
      const token = localStorage.getItem('token');
      await axios.post(
        'http://localhost:5189/api/notes',
        { patientId, content },
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );

      setContent('');
      await fetchNotes(Number(patientId)); // Refresh after submission
    } catch (err) {
      console.error('Error creating note:', err);
    }
  };

  const handlePatientIdBlur = () => {
    if (patientId && !isNaN(Number(patientId))) {
      fetchNotes(Number(patientId));
    } else {
      setNotes([]);
    }
  };

  return (
    <div className="p-6 bg-white rounded shadow">
      <h2 className="text-xl font-bold mb-4">Patient Notes</h2>

      <form onSubmit={handleSubmit} className="mb-6 space-y-4">
        <div>
          <label className="block mb-1 font-medium">Patient ID</label>
          <input
            type="number"
            value={patientId}
            onChange={(e) => setPatientId(Number(e.target.value))}
            onBlur={handlePatientIdBlur}
            className="w-full border px-3 py-2 rounded"
            required
          />
        </div>
        <div>
          <label className="block mb-1 font-medium">Note</label>
          <textarea
            value={content}
            onChange={(e) => setContent(e.target.value)}
            className="w-full border px-3 py-2 rounded"
            required
          />
        </div>
        <button type="submit" className="px-4 py-2 bg-blue-600 text-white rounded">
          Add Note
        </button>
      </form>

      {notes.length === 0 ? (
        <p>No notes available yet.</p>
      ) : (
        <ul className="space-y-3">
          {notes.map((note) => (
            <li key={note.id} className="p-3 border rounded">
              <p className="font-medium">{note.content}</p>
              <p className="text-sm text-gray-600">
                By {note.doctorName} on {new Date(note.createdAt).toLocaleString()}
              </p>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default Notes;
