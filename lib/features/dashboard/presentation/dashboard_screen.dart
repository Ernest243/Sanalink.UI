import 'package:flutter/material.dart';
import 'package:sanalink/theme/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tableau de bord',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Aperçu de la journée',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth > 1200
                    ? 4
                    : constraints.maxWidth > 800
                    ? 3
                    : 2;
                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                  children: const [
                    _StatCard(
                      title: 'Consultations Aujourd\'hui',
                      value: '142',
                      icon: Icons.calendar_month,
                      color: AppTheme.primaryColor,
                      trend: '+12%',
                    ),
                    _StatCard(
                      title: 'Patients en attente',
                      value: '18',
                      icon: Icons.people_outline,
                      color: Colors.orange,
                      trend: '-5%',
                    ),
                    _StatCard(
                      title: 'Prescriptions actives',
                      value: '84',
                      icon: Icons.medication,
                      color: Colors.purple,
                      trend: '+2%',
                    ),
                    _StatCard(
                      title: 'Urgences',
                      value: '3',
                      icon: Icons.warning_amber_rounded,
                      color: AppTheme.errorColor,
                      trend: '0%',
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rendez-vous récents',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          _buildRecentAppointmentTile(
                            'Dr. Andy',
                            'Jean willy',
                            '09:00 AM',
                            true,
                          ),
                          _buildRecentAppointmentTile(
                            'Dr. Elie',
                            'Marie Ange',
                            '10:30 AM',
                            false,
                          ),
                          _buildRecentAppointmentTile(
                            'Dr. Omar',
                            'Louis Kanga',
                            '11:15 AM',
                            true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Activité du personnel',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          const ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text('M'),
                            ),
                            title: Text('Dr. Andy'),
                            subtitle: Text('En consultation'),
                          ),
                          const ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Text('S'),
                            ),
                            title: Text('Dr. Elie'),
                            subtitle: Text('Disponible'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentAppointmentTile(
    String dotor,
    String patient,
    String time,
    bool isCompleted,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isCompleted
              ? Colors.green.withValues(alpha: 0.1)
              : Colors.orange.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          isCompleted ? Icons.check_circle : Icons.schedule,
          color: isCompleted ? Colors.green : Colors.orange,
        ),
      ),
      title: Text(patient, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('$dotor • $time'),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String trend;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.trend,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: Colors.grey),
                ),
                Icon(icon, color: color),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: trend.startsWith('+')
                        ? Colors.green.withValues(alpha: 0.1)
                        : Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    trend,
                    style: TextStyle(
                      color: trend.startsWith('+') ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
