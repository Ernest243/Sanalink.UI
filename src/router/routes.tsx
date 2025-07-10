import { Route, Routes, Navigate } from 'react-router-dom';
import Login from '../pages/Login';
import Register from '../pages/Register';
import Dashboard from '../pages/Dashboard';
import MainLayout from '../layouts/MainLayout';

const RoutesComponent = () => {
  const isAuthenticated = !!localStorage.getItem('token');

  return (
    <Routes>
      <Route path="/" element={<Navigate to={isAuthenticated ? "/dashboard" : "/login"} />} />
      <Route path="/login" element={<Login />} />
      <Route path="/register" element={<Register />} />

      {isAuthenticated && (
        <>
          <Route
            path="/dashboard"
            element={
              <MainLayout>
                <Dashboard />
              </MainLayout>
            }
          />
          {/* Placeholder routes for future features */}
          <Route
            path="/appointments"
            element={
              <MainLayout>
                <div>Appointments Page</div>
              </MainLayout>
            }
          />
          <Route
            path="/notes"
            element={
              <MainLayout>
                <div>Notes Page</div>
              </MainLayout>
            }
          />
          <Route
            path="/prescriptions"
            element={
              <MainLayout>
                <div>Prescriptions Page</div>
              </MainLayout>
            }
          />
        </>
      )}
    </Routes>
  );
};

export default RoutesComponent;
