import { useEffect, useState } from "react";
import axios from "../api/axios";
import AppointmentsChart from "../components/AppointmentsChart";
import NewPatientsChart from "../components/NewPatientsChart";

export default function Dashboard() {
  const [metrics, setMetrics] = useState({
    patients: 0,
    appointments: 0,
    prescriptions: 0,
    scheduled: 0,
    completed: 0,
    cancelled: 0,
    doctors: 0,
    nurses: 0,
    recentPatients: 0,
  });

  const token = localStorage.getItem("token");

  useEffect(() => {
    fetchMetrics();
  }, []);

  const fetchMetrics = async () => {
    const config = {
      headers: { Authorization: `Bearer ${token}` },
    };

    const [
      patientsRes,
      apptRes,
      prescRes,
      staffRes,
      recentRes
    ] = await Promise.all([
      axios.get("/Patient", config),
      axios.get("/Appointment", config),
      axios.get("/Prescriptions", config),
      axios.get("/Auth/active-staff-count", config),
      axios.get("/Patient/recent", config),
    ]);

    const appointments = apptRes.data;

    setMetrics({
      patients: patientsRes.data.length,
      appointments: appointments.length,
      scheduled: appointments.filter((a: any) => a.status === "Scheduled").length,
      completed: appointments.filter((a: any) => a.status === "Completed").length,
      cancelled: appointments.filter((a: any) => a.status === "Cancelled").length,
      prescriptions: prescRes.data.length,
      doctors: staffRes.data.doctors,
      nurses: staffRes.data.nurses,
      recentPatients: recentRes.data,
    });
  };

  return (
    <div className="p-6 space-y-6">
      <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
        <MetricCard title="Patients" value={metrics.patients} />
        <MetricCard title="Appointments" value={metrics.appointments} />
        <MetricCard title="Scheduled" value={metrics.scheduled} />
        <MetricCard title="Completed" value={metrics.completed} />
        <MetricCard title="Cancelled" value={metrics.cancelled} />
        <MetricCard title="Prescriptions" value={metrics.prescriptions} />
        <MetricCard title="Doctors" value={metrics.doctors} />
        <MetricCard title="Nurses" value={metrics.nurses} />
        <MetricCard title="New Patients (7d)" value={metrics.recentPatients} />
      </div>

      <AppointmentsChart
        data={[
          { name: "Scheduled", value: metrics.scheduled },
          { name: "Completed", value: metrics.completed },
          { name: "Cancelled", value: metrics.cancelled },
        ]}
      />

      <NewPatientsChart />
    </div>
  );
}

function MetricCard({ title, value }: { title: string; value: number }) {
  return (
    <div className="bg-white rounded-xl shadow p-4 text-center">
      <p className="text-sm text-gray-600">{title}</p>
      <p className="text-2xl font-bold text-gray-800">{value}</p>
    </div>
  );
}
