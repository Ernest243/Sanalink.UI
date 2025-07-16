import { NavLink } from 'react-router-dom';

const Sidebar = () => {
  return (
    <div className="bg-white w-64 h-full p-4 shadow">
      <div className="text-blue-600 font-bold text-xl mb-6">SanaLink</div>
      <nav className="flex flex-col space-y-4">
        <NavLink to="/dashboard">📊 Dashboard</NavLink>
        <NavLink to="/patients">🧍 Patients</NavLink>
        <NavLink to="/appointments">🗓️ Appointments</NavLink>
        <NavLink to="/notes">📝 Notes</NavLink> {/* ← Add this */}
        <NavLink to="/prescriptions">💊 Prescriptions</NavLink>
      </nav>
    </div>
  );
};

export default Sidebar;
