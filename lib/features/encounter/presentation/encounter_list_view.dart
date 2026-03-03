import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/features/encounter/providers/encounter_provider.dart';
import 'package:sanalink/models/encounter_model.dart';

class EncounterListView extends ConsumerWidget {
  const EncounterListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final encountersState = ref.watch(encounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Consultations en cours',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: encountersState.when(
        data: (encounters) {
          if (encounters.isEmpty) {
            return const Center(child: Text('Aucune consultation trouvée.'));
          }
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(encounterProvider);
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return _buildDataTable(context, ref, encounters);
                } else {
                  return _buildCardGrid(context, ref, encounters);
                }
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text(
            'Erreur lors du chargement:\n$error',
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildDataTable(
    BuildContext context,
    WidgetRef ref,
    List<EncounterModel> encounters,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Card(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(
                label: Text(
                  'N° Consultation',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Patient',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Docteur',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Maux (Motif)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Statut',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Actions',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: encounters.map((enc) {
              return DataRow(
                cells: [
                  DataCell(Text(enc.encounterNumber)),
                  DataCell(
                    Text(
                      enc.patientName,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  DataCell(Text(enc.doctorName)),
                  DataCell(Text(enc.chiefComplaint)),
                  DataCell(_buildStatusBadge(enc.status)),
                  DataCell(_buildActionDropdown(ref, enc)),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildCardGrid(
    BuildContext context,
    WidgetRef ref,
    List<EncounterModel> encounters,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: encounters.length,
      itemBuilder: (context, index) {
        final enc = encounters[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      enc.encounterNumber,
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: Colors.grey),
                    ),
                    _buildStatusBadge(enc.status),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  enc.patientName,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.medical_services,
                      size: 16,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 8),
                    Text('Médecin: ${enc.doctorName}'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.speaker_notes,
                      size: 16,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text('Motif: ${enc.chiefComplaint}')),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Modifier le statut: '),
                    const SizedBox(width: 12),
                    _buildActionDropdown(ref, enc),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    String label;
    switch (status) {
      case 'Open':
        color = Colors.blue;
        label = 'Ouvert';
        break;
      case 'InProgress':
        color = Colors.orange;
        label = 'En cours';
        break;
      case 'Closed':
        color = Colors.green;
        label = 'Terminé';
        break;
      default:
        color = Colors.grey;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildActionDropdown(WidgetRef ref, EncounterModel encounter) {
    return DropdownButton<String>(
      value: encounter.status,
      icon: const Icon(Icons.arrow_drop_down),
      underline: const SizedBox(),
      onChanged: (String? newValue) {
        if (newValue != null && newValue != encounter.status) {
          ref
              .read(encounterProvider.notifier)
              .updateStatus(encounter.id, newValue);
        }
      },
      items: const [
        DropdownMenuItem(value: 'Open', child: Text('Ouvert')),
        DropdownMenuItem(value: 'InProgress', child: Text('En cours')),
        DropdownMenuItem(value: 'Closed', child: Text('Terminé')),
      ],
    );
  }
}
