const Topbar = () => {
  return (
    <header className="bg-white shadow px-6 py-4 ml-64">
      <div className="flex justify-between items-center">
        <h1 className="text-xl font-semibold text-gray-700">Dashboard</h1>
        <div className="flex items-center space-x-4">
          {/* Placeholder for user info or actions */}
          <span className="text-gray-600">Welcome, Doctor</span>
          <button className="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded">
            Logout
          </button>
        </div>
      </div>
    </header>
  );
};

export default Topbar;
