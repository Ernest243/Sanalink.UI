import { Routes, Route } from 'react-router-dom';
import Login from './pages/Login';
import Register from './pages/Register';
import DashboardLayout from './layouts/DashboardLayout';
import Dashboard from './pages/Dashboard';
import Notes from './pages/Notes';
import Prescriptions from './pages/Prescriptions';

const App = () => {
  return (
    <Routes>
      <Route path="/login" element={<Login />} />
      <Route path="/register" element={<Register />} />

      {/* Single nested route declaration for dashboard */}
      <Route path="/dashboard" element={<DashboardLayout />}>
        <Route index element={<Dashboard />} />
        <Route path="notes" element={<Notes />} /> {/* ✅ Fixed */}
        <Route path="prescriptions" element={<Prescriptions />} />
      </Route>
    </Routes>
  );
};

export default App;
