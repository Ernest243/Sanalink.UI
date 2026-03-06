import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/features/admin/providers/admin_providers.dart';
import 'package:sanalink/features/dashboard/providers/dashboard_providers.dart';
import 'package:sanalink/theme/app_theme.dart';

/// Section analytics complète affichée sous les cartes du tableau de bord.
class AnalyticsChartsSection extends ConsumerWidget {
  const AnalyticsChartsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final encounterAsync = ref.watch(encounterAnalyticsProvider);
    final perDayAsync = ref.watch(appointmentsPerDayProvider);
    final staffAsync = ref.watch(staffListProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Analytiques',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        // ── Row 1: appointments bar + encounter donut ──────────────────────
        LayoutBuilder(builder: (context, constraints) {
          final wide = constraints.maxWidth > 700;
          final charts = [
            _ChartCard(
              title: 'Rendez-vous (10 derniers jours)',
              icon: Icons.calendar_month,
              child: perDayAsync.when(
                data: (data) => data.dates.isEmpty
                    ? _emptyWidget('Aucune donnée')
                    : _PerDayBarChart(data: data, color: AppTheme.primaryColor),
                loading: _loadingWidget,
                error: (_, __) => _emptyWidget('Données indisponibles'),
              ),
            ),
            _ChartCard(
              title: 'Statut des consultations',
              icon: Icons.medical_services,
              child: encounterAsync.when(
                data: (data) => data.total == 0
                    ? _emptyWidget('Aucune consultation')
                    : _EncounterDonutChart(data: data),
                loading: _loadingWidget,
                error: (_, __) => _emptyWidget('Données indisponibles'),
              ),
            ),
          ];

          if (wide) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: charts[0]),
                const SizedBox(width: 16),
                Expanded(child: charts[1]),
              ],
            );
          }
          return Column(children: [
            charts[0],
            const SizedBox(height: 16),
            charts[1],
          ]);
        }),

        const SizedBox(height: 16),

        // ── Row 2: staff by role ────────────────────────────────────────────
        _ChartCard(
          title: 'Personnel par rôle',
          icon: Icons.people,
          child: staffAsync.when(
            data: (staff) => staff.isEmpty
                ? _emptyWidget('Aucun personnel')
                : _StaffByRoleBarChart(staff: staff
                    .map((s) => s.role)
                    .toList()),
            loading: _loadingWidget,
            error: (_, __) => _emptyWidget('Données indisponibles'),
          ),
        ),

        const SizedBox(height: 16),

        // ── Row 3: patient registrations + prescriptions per day ───────────
        LayoutBuilder(builder: (context, constraints) {
          final wide = constraints.maxWidth > 700;
          final charts = [
            const _PatientRegistrationsChart(),
            const _PrescriptionsPerDayChart(),
          ];
          if (wide) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: charts[0]),
                const SizedBox(width: 16),
                Expanded(child: charts[1]),
              ],
            );
          }
          return Column(children: [
            charts[0],
            const SizedBox(height: 16),
            charts[1],
          ]);
        }),
      ],
    );
  }
}

Widget _loadingWidget() =>
    const SizedBox(height: 180, child: Center(child: CircularProgressIndicator()));

Widget _emptyWidget(String msg) => SizedBox(
      height: 180,
      child: Center(
        child: Text(msg, style: const TextStyle(color: Colors.grey)),
      ),
    );

// ─── Chart wrapper card ────────────────────────────────────────────────────

class _ChartCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final Widget? trailing;

  const _ChartCard({
    required this.title,
    required this.icon,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(icon, size: 18, color: AppTheme.primaryColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              if (trailing != null) trailing!,
            ]),
            const Divider(height: 20),
            child,
          ],
        ),
      ),
    );
  }
}

// ─── Period selector ──────────────────────────────────────────────────────

class _PeriodSelector extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onChanged;

  static const _options = [(label: '7J', days: 7), (label: '30J', days: 30), (label: '3M', days: 90)];

  const _PeriodSelector({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _options
          .map((o) => Padding(
                padding: const EdgeInsets.only(left: 4),
                child: ChoiceChip(
                  label: Text(o.label, style: const TextStyle(fontSize: 11)),
                  selected: selected == o.days,
                  onSelected: (_) => onChanged(o.days),
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                ),
              ))
          .toList(),
    );
  }
}

// ─── Chart 1: Appointments per day (bar) ──────────────────────────────────

class _PerDayBarChart extends StatelessWidget {
  final AppointmentsPerDay data;
  final Color color;
  const _PerDayBarChart({required this.data, required this.color});

  @override
  Widget build(BuildContext context) {
    final maxY = (data.counts.isEmpty ? 1 : data.counts.reduce((a, b) => a > b ? a : b))
        .toDouble();

    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          maxY: maxY + 1,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (_) =>
                const FlLine(color: Color(0xFFEEEEEE), strokeWidth: 1),
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  final idx = value.toInt();
                  if (idx < 0 || idx >= data.dates.length) {
                    return const SizedBox.shrink();
                  }
                  // Show only every other label to avoid crowding
                  if (idx % 2 != 0) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(data.dates[idx],
                        style: const TextStyle(fontSize: 10)),
                  );
                },
                reservedSize: 28,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, _) => Text(
                  value.toInt().toString(),
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          barGroups: List.generate(data.counts.length, (i) {
            return BarChartGroupData(x: i, barRods: [
              BarChartRodData(
                toY: data.counts[i].toDouble(),
                color: color,
                width: 14,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4)),
              ),
            ]);
          }),
        ),
      ),
    );
  }
}

// ─── Chart 2: Encounter status (donut) ────────────────────────────────────

class _EncounterDonutChart extends StatefulWidget {
  final EncounterAnalytics data;
  const _EncounterDonutChart({required this.data});

  @override
  State<_EncounterDonutChart> createState() => _EncounterDonutChartState();
}

class _EncounterDonutChartState extends State<_EncounterDonutChart> {
  int _touched = -1;

  @override
  Widget build(BuildContext context) {
    final sections = [
      _DonutSection('Ouvert', widget.data.open, Colors.orange),
      _DonutSection('En cours', widget.data.inProgress, Colors.blue),
      _DonutSection('Clôturé', widget.data.closed, Colors.green),
    ].where((s) => s.value > 0).toList();

    return SizedBox(
      height: 200,
      child: Row(
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (event, response) {
                    setState(() {
                      _touched = (event.isInterestedForInteractions &&
                              response?.touchedSection != null)
                          ? response!.touchedSection!.touchedSectionIndex
                          : -1;
                    });
                  },
                ),
                centerSpaceRadius: 50,
                sectionsSpace: 2,
                sections: List.generate(sections.length, (i) {
                  final s = sections[i];
                  final isTouched = i == _touched;
                  return PieChartSectionData(
                    value: s.value.toDouble(),
                    color: s.color,
                    radius: isTouched ? 36 : 28,
                    title: '${s.value}',
                    titleStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sections
                .map((s) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(children: [
                        Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                color: s.color, shape: BoxShape.circle)),
                        const SizedBox(width: 6),
                        Text('${s.label} (${s.value})',
                            style: const TextStyle(fontSize: 12)),
                      ]),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _DonutSection {
  final String label;
  final int value;
  final Color color;
  const _DonutSection(this.label, this.value, this.color);
}

// ─── Chart 3: Staff by role (horizontal bar) ──────────────────────────────

class _StaffByRoleBarChart extends StatelessWidget {
  final List<String?> staff;
  const _StaffByRoleBarChart({required this.staff});

  @override
  Widget build(BuildContext context) {
    // Count occurrences per role
    final counts = <String, int>{};
    for (final role in staff) {
      final r = role ?? 'Inconnu';
      counts[r] = (counts[r] ?? 0) + 1;
    }
    final roles = counts.keys.toList()
      ..sort((a, b) => counts[b]!.compareTo(counts[a]!));
    final maxX = counts.values.reduce((a, b) => a > b ? a : b).toDouble();

    const roleColors = {
      'Doctor': Colors.blue,
      'Nurse': Colors.green,
      'Pharmacist': Colors.orange,
      'Admin': Colors.red,
      'LabTech': Colors.purple,
      'DAF': Colors.teal,
      'Accueil': Colors.brown,
    };

    return SizedBox(
      height: (roles.length * 44.0).clamp(120, 300),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          maxY: maxX + 1,
          barTouchData: BarTouchData(enabled: false),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: false,
            getDrawingVerticalLine: (_) =>
                const FlLine(color: Color(0xFFEEEEEE), strokeWidth: 1),
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 80,
                getTitlesWidget: (value, _) {
                  final idx = value.toInt();
                  if (idx < 0 || idx >= roles.length) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Text(
                      roles[idx],
                      style: const TextStyle(fontSize: 11),
                      textAlign: TextAlign.right,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 24,
                getTitlesWidget: (value, _) => Text(
                  value.toInt().toString(),
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ),
            topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)),
          ),
          barGroups: List.generate(roles.length, (i) {
            final role = roles[i];
            final color =
                roleColors[role] ?? AppTheme.primaryColor;
            return BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: counts[role]!.toDouble(),
                  color: color,
                  width: 20,
                  borderRadius:
                      const BorderRadius.horizontal(right: Radius.circular(4)),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

// ─── Chart 4: Patient registrations per day (bar + period toggle) ─────────

class _PatientRegistrationsChart extends ConsumerStatefulWidget {
  const _PatientRegistrationsChart();

  @override
  ConsumerState<_PatientRegistrationsChart> createState() =>
      _PatientRegistrationsChartState();
}

class _PatientRegistrationsChartState
    extends ConsumerState<_PatientRegistrationsChart> {
  int _days = 7;

  @override
  Widget build(BuildContext context) {
    final dataAsync = ref.watch(patientRegistrationsProvider(_days));
    return _ChartCard(
      title: 'Inscriptions patients',
      icon: Icons.person_add,
      trailing: _PeriodSelector(
        selected: _days,
        onChanged: (d) => setState(() => _days = d),
      ),
      child: dataAsync.when(
        data: (data) => data.dates.isEmpty
            ? _emptyWidget('Aucune inscription')
            : _PerDayBarChart(data: data, color: Colors.teal),
        loading: _loadingWidget,
        error: (_, __) => _emptyWidget('Données indisponibles'),
      ),
    );
  }
}

// ─── Chart 5: Prescriptions per day (bar + period toggle) ─────────────────

class _PrescriptionsPerDayChart extends ConsumerStatefulWidget {
  const _PrescriptionsPerDayChart();

  @override
  ConsumerState<_PrescriptionsPerDayChart> createState() =>
      _PrescriptionsPerDayChartState();
}

class _PrescriptionsPerDayChartState
    extends ConsumerState<_PrescriptionsPerDayChart> {
  int _days = 7;

  @override
  Widget build(BuildContext context) {
    final dataAsync = ref.watch(prescriptionAnalyticsProvider(_days));
    return _ChartCard(
      title: 'Prescriptions émises',
      icon: Icons.medication,
      trailing: _PeriodSelector(
        selected: _days,
        onChanged: (d) => setState(() => _days = d),
      ),
      child: dataAsync.when(
        data: (data) => data.dates.isEmpty
            ? _emptyWidget('Aucune prescription')
            : _PerDayBarChart(data: data, color: Colors.purple),
        loading: _loadingWidget,
        error: (_, __) => _emptyWidget('Données indisponibles'),
      ),
    );
  }
}
