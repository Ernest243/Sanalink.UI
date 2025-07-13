import { Link } from 'react-router-dom';

const Sidebar = () => {
  return (
    <div className="w-64 bg-gray-800 text-white h-screen p-4 fixed">
      <h2 className="text-2xl font-bold mb-8">SanaLink</h2>
      <nav className="flex flex-col gap-4">
        <Link to="/dashboard" className="hover:text-blue-300">Dashboard</Link>
        <Link to="/patients" className="hover:text-blue-300">Patients</Link>
        <Link to="/appointments" className="hover:text-blue-300">Appointments</Link>
        <Link to="/notes" className="hover:text-blue-300">Notes</Link>
        <Link to="/prescriptions" className="hover:text-blue-300">Prescriptions</Link>
      </nav>
    </div>
  );
};

export default Sidebar;
