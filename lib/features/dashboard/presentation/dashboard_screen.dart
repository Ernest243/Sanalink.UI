import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/core/auth/auth_service.dart';
import 'package:sanalink/features/dashboard/presentation/analytics_charts.dart';
import 'package:sanalink/features/dashboard/providers/dashboard_providers.dart';
import 'package:sanalink/models/encounter_model.dart';
import 'package:sanalink/theme/app_theme.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  void _refresh(WidgetRef ref) {
    ref.invalidate(appointmentAnalyticsProvider);
    ref.invalidate(activeStaffCountProvider);
    ref.invalidate(recentEncountersProvider);
    ref.invalidate(encounterAnalyticsProvider);
    ref.invalidate(appointmentsPerDayProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsAsync = ref.watch(appointmentAnalyticsProvider);
    final staffAsync = ref.watch(activeStaffCountProvider);
    final encountesAsync = ref.watch(recentEncountersProvider);
    final user = ref.watch(authServiceProvider).value?.user;
    final isAdmin = user?.role == 'Admin';

    final body = SingleChildScrollView(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Page header ───────────────────────────────────────────────
          if (isAdmin) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tableau de bord',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Bienvenue, ${user?.firstName ?? ''} — voici l\'aperçu du système.',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton.outlined(
                  icon: const Icon(Icons.refresh_rounded),
                  tooltip: 'Actualiser',
                  onPressed: () => _refresh(ref),
                ),
              ],
            ),
            const SizedBox(height: 28),
          ] else ...[
            const SizedBox(height: 8),
          ],

          // ── Stat cards ────────────────────────────────────────────────
          analyticsAsync.when(
            data: (analytics) => _buildStatsGrid(context, analytics, isAdmin),
            loading: () =>
                const Center(child: CircularProgressIndicator()),
            error: (_, __) =>
                _buildStatsGrid(context, AppointmentAnalytics.empty, isAdmin),
          ),
          const SizedBox(height: 28),

          // ── Recent encounters + active staff ──────────────────────────
          LayoutBuilder(builder: (context, constraints) {
            final wide = constraints.maxWidth > 700;
            final encounterCard = Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.receipt_long_rounded,
                            size: 18, color: AppTheme.primaryColor),
                        const SizedBox(width: 8),
                        const Text('Consultations récentes',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Divider(height: 20),
                    encountesAsync.when(
                      data: (encounters) => encounters.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text('Aucune consultation trouvée.'),
                            )
                          : Column(
                              children: encounters
                                  .map(_buildEncounterTile)
                                  .toList(),
                            ),
                      loading: () => const Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(),
                      ),
                      error: (_, __) => const Padding(
                        padding: EdgeInsets.all(16),
                        child:
                            Text('Impossible de charger les consultations.'),
                      ),
                    ),
                  ],
                ),
              ),
            );

            final staffCard = Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.people_rounded,
                            size: 18, color: AppTheme.primaryColor),
                        const SizedBox(width: 8),
                        const Text('Personnel actif',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Divider(height: 20),
                    staffAsync.when(
                      data: (staff) => Column(
                        children: [
                          _StaffTile(
                            icon: Icons.medical_services_rounded,
                            color: Colors.blue,
                            label: 'Médecin(s)',
                            count: staff.doctors,
                          ),
                          const SizedBox(height: 8),
                          _StaffTile(
                            icon: Icons.healing_rounded,
                            color: Colors.green,
                            label: 'Infirmier(s)',
                            count: staff.nurses,
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
            );

            if (wide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: encounterCard),
                  const SizedBox(width: 16),
                  Expanded(flex: 1, child: staffCard),
                ],
              );
            }
            return Column(children: [
              encounterCard,
              const SizedBox(height: 16),
              staffCard,
            ]);
          }),

          const SizedBox(height: 28),
          const AnalyticsChartsSection(),
        ],
      ),
    );

    if (isAdmin) {
      return Scaffold(backgroundColor: Colors.transparent, body: body);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de bord',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _refresh(ref),
          ),
        ],
      ),
      body: body,
    );
  }

  Widget _buildStatsGrid(
      BuildContext context, AppointmentAnalytics analytics, bool isAdmin) {
    final cards = [
      _StatCard(
        title: 'Total Consultations',
        value: '${analytics.totalAppointments}',
        icon: Icons.calendar_month_rounded,
        color: AppTheme.primaryColor,
        isAdmin: isAdmin,
      ),
      _StatCard(
        title: 'Rendez-vous programmés',
        value: '${analytics.scheduled}',
        icon: Icons.event_available_rounded,
        color: Colors.orange,
        isAdmin: isAdmin,
      ),
      _StatCard(
        title: 'Prescriptions émises',
        value: '${analytics.totalPrescriptions}',
        icon: Icons.medication_rounded,
        color: Colors.purple,
        isAdmin: isAdmin,
      ),
      _StatCard(
        title: 'Patients enregistrés',
        value: '${analytics.totalPatients}',
        icon: Icons.person_add_alt_1_rounded,
        color: Colors.teal,
        isAdmin: isAdmin,
      ),
    ];

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
          childAspectRatio: isAdmin ? 1.6 : 1.5,
          children: cards,
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
  final bool isAdmin;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.isAdmin = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isAdmin) {
      return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.withValues(alpha: 0.12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: color, size: 20),
                  ),
                ],
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Default style for non-admin roles
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

// ─── Staff tile used in the personnel actif card ──────────────────────────

class _StaffTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final int count;
  const _StaffTile({
    required this.icon,
    required this.color,
    required this.label,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(label,
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w500)),
          ),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
