import axios from 'axios';
import { useEffect, useState } from 'react';
import {
  Chart as ChartJS,
  LineElement,
  PointElement,
  CategoryScale,
  LinearScale,
  Tooltip,
  Legend
} from 'chart.js';
import { Line } from 'react-chartjs-2';

// Register Chart.js components
ChartJS.register(LineElement, PointElement, CategoryScale, LinearScale, Tooltip, Legend);

const AppointmentsChart = () => {
  const [chartData, setChartData] = useState<any>(null);

  useEffect(() => {
    const fetchChartData = async () => {
      try {
        const token = localStorage.getItem('token');
        const response = await axios.get('/api/analytics/appointments-per-day', {
          headers: {
            Authorization: `Bearer ${token}`
          }
        });

        const { dates, counts } = response.data;

        setChartData({
          labels: dates,
          datasets: [
            {
              label: 'Appointments',
              data: counts,
              fill: false,
              tension: 0.3,
              borderColor: '#3b82f6',         // Blue line
              backgroundColor: '#3b82f6',     // Blue points
              borderWidth: 2,
              pointRadius: 4,
              pointHoverRadius: 6
            }
          ]
        });
      } catch (err) {
        console.error('Error fetching appointment chart data: ', err);
      }
    };

    fetchChartData();
  }, []);

  const options = {
    responsive: true,
    plugins: {
      legend: {
        display: true,
        position: 'top' as const
      },
      tooltip: {
        mode: 'index' as const,
        intersect: false
      }
    },
    scales: {
      y: {
        beginAtZero: true,
        suggestedMax: 5,
        ticks: {
          stepSize: 1
        },
        grid: {
          drawBorder: false,
          color: '#E5E7EB'
        }
      },
      x: {
        grid: {
          display: false
        }
      }
    }
  };

  return (
    <div className="bg-white p-6 rounded shadow">
      <h3 className="text-lg font-semibold mb-2">Appointments Over Time</h3>
      {chartData ? (
        <Line data={chartData} options={options} />
      ) : (
        <p>Loading chart...</p>
      )}
    </div>
  );
};

export default AppointmentsChart;
