import type { ReactNode } from 'react';
import { useNavigate } from 'react-router-dom';

const MainLayout = ({ children }: { children: ReactNode }) => {
  const navigate = useNavigate();

  const handleLogout = () => {
    localStorage.removeItem('token');
    navigate('/login');
  };

  return (
    <div className="min-h-screen bg-gray-100 flex flex-col">
      {/* Top Nav */}
      <header className="bg-white shadow px-4 py-3 flex justify-between items-center">
        <h1 className="text-xl font-bold text-blue-600">SanaLink</h1>
        <button
          onClick={handleLogout}
          className="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600"
        >
          Logout
        </button>
      </header>

      {/* Main Content */}
      <main className="flex-1 p-6">
        {children}
      </main>
    </div>
  );
};

export default MainLayout;
