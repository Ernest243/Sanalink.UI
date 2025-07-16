import { Outlet, Link, useNavigate } from 'react-router-dom';
import { useEffect } from 'react';

const DashboardLayout = () => {
  const navigate = useNavigate();
  const token = localStorage.getItem('token');

  useEffect(() => {
    if (!token) navigate('/login');
  }, [token, navigate]);

  const handleLogout = () => {
    localStorage.removeItem('token');
    navigate('/login');
  };

  return (
    <div className="flex min-h-screen bg-gray-50">
      {/* Sidebar */}
      <aside className="w-64 bg-white shadow-md p-6 space-y-6">
        <h1 className="text-2xl font-extrabold text-blue-600">SanaLink</h1>
        <nav className="space-y-3">
          <Link to="/dashboard" className="flex items-center px-3 py-2 rounded-lg text-gray-700 hover:bg-blue-100 hover:text-blue-600 font-medium">
            📊 Dashboard
          </Link>
          <Link to="/dashboard/patients" className="flex items-center px-3 py-2 rounded-lg text-gray-700 hover:bg-blue-100 hover:text-blue-600 font-medium">
            👨‍⚕️ Patients
          </Link>
          <Link to="/dashboard/appointments" className="flex items-center px-3 py-2 rounded-lg text-gray-700 hover:bg-blue-100 hover:text-blue-600 font-medium">
            📅 Appointments
          </Link>
          <Link to="/dashboard/notes" className="flex items-center px-3 py-2 rounded-lg text-gray-700 hover:bg-blue-100 hover:text-blue-600 font-medium">
            📝 Notes
          </Link>
          <Link to="/dashboard/prescriptions" className="flex items-center px-3 py-2 rounded-lg text-gray-700 hover:bg-blue-100 hover:text-blue-600 font-medium">
            💊 Prescriptions
          </Link>
        </nav>
      </aside>

      {/* Main Content */}
      <main className="flex-1 flex flex-col">
        {/* Header */}
        <header className="bg-white shadow-sm px-6 py-4 flex justify-between items-center">
          <h2 className="text-xl font-semibold text-gray-800">Dashboard</h2>
          <div className="flex items-center space-x-4">
            <span className="text-gray-600">Welcome, Doctor</span>
            <button
              onClick={handleLogout}
              className="bg-red-500 text-white px-4 py-2 rounded-md hover:bg-red-600"
            >
              Logout
            </button>
          </div>
        </header>

        {/* Page Content */}
        <div className="p-6 bg-gray-50 flex-1">
          <Outlet />
        </div>
      </main>
    </div>
  );
};

export default DashboardLayout;
