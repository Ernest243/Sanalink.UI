import AppointmentsChart from '../components/AppointmentsChart';

const Dashboard = () => {
  return (
    <div className="p-6 space-y-6">
      {/* ...metrics cards here... */}
      <AppointmentsChart />
    </div>
  );
};

export default Dashboard;
