import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/features/dashboard/presentation/analytics_charts.dart';
import 'package:sanalink/features/dashboard/providers/dashboard_providers.dart';
import 'package:sanalink/models/encounter_model.dart';
import 'package:sanalink/theme/app_theme.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsAsync = ref.watch(appointmentAnalyticsProvider);
    final staffAsync = ref.watch(activeStaffCountProvider);
    final encountesAsync = ref.watch(recentEncountersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tableau de bord',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(appointmentAnalyticsProvider);
              ref.invalidate(activeStaffCountProvider);
              ref.invalidate(recentEncountersProvider);
              ref.invalidate(encounterAnalyticsProvider);
              ref.invalidate(appointmentsPerDayProvider);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Aperçu de la journée',
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            analyticsAsync.when(
              data: (analytics) => _buildStatsGrid(context, analytics),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) => _buildStatsGrid(
                  context, AppointmentAnalytics.empty),
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
                            'Consultations récentes',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          encountesAsync.when(
                            data: (encounters) => encounters.isEmpty
                                ? const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text('Aucune consultation trouvée.'),
                                  )
                                : Column(
                                    children: encounters
                                        .map((e) =>
                                            _buildEncounterTile(e))
                                        .toList(),
                                  ),
                            loading: () => const Padding(
                              padding: EdgeInsets.all(16),
                              child: CircularProgressIndicator(),
                            ),
                            error: (_, __) => const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text('Impossible de charger les consultations.'),
                            ),
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
                            'Personnel actif',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          staffAsync.when(
                            data: (staff) => Column(
                              children: [
                                ListTile(
                                  leading: const CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    child: Icon(Icons.medical_services,
                                        color: Colors.white, size: 18),
                                  ),
                                  title: Text('${staff.doctors} Médecin(s)'),
                                  subtitle: const Text('Actif(s)'),
                                ),
                                ListTile(
                                  leading: const CircleAvatar(
                                    backgroundColor: Colors.green,
                                    child: Icon(Icons.healing,
                                        color: Colors.white, size: 18),
                                  ),
                                  title: Text('${staff.nurses} Infirmier(s)'),
                                  subtitle: const Text('Actif(s)'),
                                ),
                              ],
                            ),
                            loading: () => const Center(
                                child: CircularProgressIndicator()),
                            error: (_, __) =>
                                const Text('Données indisponibles'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const AnalyticsChartsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsGrid(
      BuildContext context, AppointmentAnalytics analytics) {
    return LayoutBuilder(
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
          children: [
            _StatCard(
              title: 'Total Consultations',
              value: '${analytics.totalAppointments}',
              icon: Icons.calendar_month,
              color: AppTheme.primaryColor,
            ),
            _StatCard(
              title: 'Rendez-vous programmés',
              value: '${analytics.scheduled}',
              icon: Icons.people_outline,
              color: Colors.orange,
            ),
            _StatCard(
              title: 'Prescriptions actives',
              value: '${analytics.totalPrescriptions}',
              icon: Icons.medication,
              color: Colors.purple,
            ),
            _StatCard(
              title: 'Patients enregistrés',
              value: '${analytics.totalPatients}',
              icon: Icons.person_add_alt_1,
              color: AppTheme.errorColor,
            ),
          ],
        );
      },
    );
  }

  Widget _buildEncounterTile(EncounterModel encounter) {
    final isOpen = encounter.status == 'Open' || encounter.status == 'InProgress';
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isOpen
              ? Colors.orange.withValues(alpha: 0.1)
              : Colors.green.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          isOpen ? Icons.schedule : Icons.check_circle,
          color: isOpen ? Colors.orange : Colors.green,
        ),
      ),
      title: Text(
        encounter.patientName.isNotEmpty
            ? encounter.patientName
            : 'Patient #${encounter.patientId}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('${encounter.doctorName} • ${encounter.status}'),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
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
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(icon, color: color),
              ],
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
