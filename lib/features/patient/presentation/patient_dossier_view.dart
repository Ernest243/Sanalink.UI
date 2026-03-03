import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/features/clinical/providers/clinical_providers.dart';
import 'package:sanalink/models/encounter_model.dart';
import 'package:sanalink/services/patient_resolver_service.dart';
import 'package:sanalink/core/demo/demo_store.dart';
import 'package:sanalink/theme/app_theme.dart';

/// [PatientDossierView] est le composant central affichant l'historique clinique,
/// les constantes vitale, et permettant de finaliser une consultation.
class PatientDossierView extends ConsumerWidget {
  /// L'identifiant du patient (utilisé pour les notes/historique)
  final int? patientId;

  /// L'objet fournit les constantes et l'état actuel
  final EncounterModel? encounter;

  const PatientDossierView({super.key, this.patientId, this.encounter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Priorité à l'ID contenu dans l'objet encounter si disponible
    final effectivePatientId = encounter?.patientId ?? patientId ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dossier Patient',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          // Si une rencontre est active (InProgress), on affiche le bouton de clôture
          if (encounter != null && encounter!.status == 'InProgress')
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ElevatedButton.icon(
                onPressed: () => _finalizeConsultation(context, ref),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Finaliser la consultation'),
              ),
            ),
        ],
      ),
      body: FutureBuilder<String>(
        // On résout le nom du patient par son ID via le service dédié
        future: ref
            .read(patientResolverServiceProvider.notifier)
            .resolvePatientName(effectivePatientId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final patientName =
              snapshot.data ?? encounter?.patientName ?? 'Inconnu';

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, patientName),
                const SizedBox(height: 24),
                Expanded(child: _buildTabs(context, ref, effectivePatientId)),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Construit l'en-tête du dossier avec les informations d'identité
  /// extraites dynamiquement pour correspondre aux données du DemoStore.
  Widget _buildHeader(BuildContext context, String patientName) {
    // Dans la version réelle, on aurai l'objet patient.
    // Ici on simule avec les données reçues ou par défaut.
    final age = encounter != null
        ? (DateTime.now().year - 1980)
        : 44; // Fallback simuler

    return Card(
      elevation: 0,
      color: AppTheme.primaryColor.withValues(alpha: 0.05),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: AppTheme.primaryColor,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patientName,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.cake, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text('$age ans'),
                      const SizedBox(width: 24),
                      const Icon(Icons.male, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      const Text('Profil Vérifié'),
                      const SizedBox(width: 24),
                      const Icon(Icons.pin, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text('ID: ${encounter?.patientId ?? patientId}'),
                    ],
                  ),
                ],
              ),
            ),
            _buildVitalsSummary(encounter?.vitals),
          ],
        ),
      ),
    );
  }

  /// Analyse et affiche les constantes vitale.
  /// Format attendu : "TA: 120/80, FC: 72, Temp: 37.5C"
  Widget _buildVitalsSummary(String? vitalsRaw) {
    if (vitalsRaw == null || vitalsRaw.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: const Text(
          'Aucune constante saisie',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      );
    }

    final ta =
        RegExp(r'TA:\s*([^\s,]+)').firstMatch(vitalsRaw)?.group(1) ?? '--';
    final fc =
        RegExp(r'FC:\s*([^\s,]+)').firstMatch(vitalsRaw)?.group(1) ?? '--';
    final temp =
        RegExp(r'Temp:\s*([^\s,C]+)').firstMatch(vitalsRaw)?.group(1) ?? '--';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'Constantes (Triage)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _VitalBadge(
                icon: Icons.favorite,
                value: '$fc bpm',
                color: Colors.red,
              ),
              const SizedBox(width: 12),
              _VitalBadge(
                icon: Icons.thermostat,
                value: '$temp°C',
                color: Colors.orange,
              ),
              const SizedBox(width: 12),
              _VitalBadge(icon: Icons.compress, value: ta, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  /// Gère les onglets du dossier (Notes, Labo, Prescriptions)
  Widget _buildTabs(BuildContext context, WidgetRef ref, int patientId) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            labelColor: AppTheme.primaryColor,
            indicatorColor: AppTheme.primaryColor,
            tabs: [
              Tab(icon: Icon(Icons.history_edu), text: 'Notes & Historique'),
              Tab(icon: Icon(Icons.science), text: 'Laboratoire'),
              Tab(icon: Icon(Icons.medication), text: 'Prescriptions'),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              children: [
                _buildNotesTab(context, ref, patientId),
                _buildLabTab(patientId),
                _buildPrescriptionsTab(patientId),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Onglet des notes cliniques
  Widget _buildNotesTab(BuildContext context, WidgetRef ref, int patientId) {
    // Récupération de l'historique depuis le provider
    final historyAsync = ref.watch(patientHistoryProvider(patientId));

    return Stack(
      children: [
        historyAsync.when(
          data: (history) => ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              final enc = history[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            enc.status == 'Closed'
                                ? 'Consultation passée'
                                : 'Consultation en cours',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: enc.status == 'Closed'
                                  ? Colors.grey
                                  : AppTheme.primaryColor,
                            ),
                          ),
                          Text(
                            '${enc.createdAt.day}/${enc.createdAt.month}/${enc.createdAt.year}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Motif: ${enc.chiefComplaint}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (enc.diagnosis != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          'Diagnostic: ${enc.diagnosis}',
                          style: const TextStyle(color: Colors.blueGrey),
                        ),
                      ],
                      const SizedBox(height: 12),
                      Text(enc.clinicalNotes ?? 'Pas de note saisie.'),
                    ],
                  ),
                ),
              );
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => Center(child: Text('Erreur: $e')),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton.extended(
            onPressed: () => _showNoteDialog(context, ref, patientId),
            icon: const Icon(Icons.add),
            label: const Text('Nouvelle Note'),
          ),
        ),
      ],
    );
  }

  /// Affiche un dialogue pour saisir une nouvelle note clinique
  void _showNoteDialog(BuildContext context, WidgetRef ref, int patientId) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ajouter une note clinique'),
        content: TextFormField(
          controller: controller,
          maxLines: 5,
          decoration: const InputDecoration(
            hintText: 'Saisissez vos observations ici...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (controller.text.isNotEmpty) {
                await ref
                    .read(consultationListProvider.notifier)
                    .addNote(patientId, controller.text);
                if (context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Note ajoutée avec succès')),
                  );
                }
              }
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }

  /// Procédure de clôture de la consultation
  void _finalizeConsultation(BuildContext context, WidgetRef ref) async {
    final diagController = TextEditingController();
    final notesController = TextEditingController(
      text: encounter?.clinicalNotes,
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Finaliser la Consultation'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: diagController,
              decoration: const InputDecoration(
                labelText: 'Diagnostic Final',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: notesController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Commentaires additionnels',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (diagController.text.isNotEmpty) {
                await ref
                    .read(consultationListProvider.notifier)
                    .closeConsultation(
                      encounter!.id,
                      diagController.text,
                      notesController.text,
                    );
                if (context.mounted) {
                  Navigator.pop(context); // Ferme le dialogue
                  Navigator.pop(context); // Ferme le BottomSheet (le dossier)
                }
              }
            },
            child: const Text('Clôturer'),
          ),
        ],
      ),
    );
  }

  /// Onglet Laboratoire : Affiche les examens du patient
  Widget _buildLabTab(int patientId) {
    return Consumer(
      builder: (context, ref, child) {
        // En mode démo, on utilise directement le store pour simplifier la vue
        final orders = DemoStore.instance.labOrders
            .where((o) => o.patientId == patientId)
            .toList();

        if (orders.isEmpty) {
          return const Center(
            child: Text('Aucun examen de laboratoire pour ce patient.'),
          );
        }

        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return ListTile(
              leading: Icon(
                order.status == 'Completed'
                    ? Icons.check_circle
                    : Icons.hourglass_empty,
                color: order.status == 'Completed'
                    ? Colors.green
                    : Colors.orange,
              ),
              title: Text(order.testName),
              subtitle: Text(
                order.status == 'Completed'
                    ? 'Résultat: ${order.result}'
                    : 'En attente',
              ),
              trailing: Text('${order.createdAt.day}/${order.createdAt.month}'),
            );
          },
        );
      },
    );
  }

  /// Onglet Prescriptions : Affiche les médicaments prescrits
  Widget _buildPrescriptionsTab(int patientId) {
    return Consumer(
      builder: (context, ref, child) {
        final prescriptions = DemoStore.instance.prescriptions
            .where((p) => p.patientId == patientId)
            .toList();

        if (prescriptions.isEmpty) {
          return const Center(child: Text('Aucune prescription enregistrée.'));
        }

        return ListView.builder(
          itemCount: prescriptions.length,
          itemBuilder: (context, index) {
            final p = prescriptions[index];
            return ListTile(
              leading: Icon(
                p.status == 'Dispensed' ? Icons.medication : Icons.description,
                color: p.status == 'Dispensed'
                    ? AppTheme.primaryColor
                    : Colors.grey,
              ),
              title: Text(p.medicationName),
              subtitle: Text('${p.dosage} - ${p.status}'),
              trailing: Text('${p.createdAt.day}/${p.createdAt.month}'),
            );
          },
        );
      },
    );
  }
}

class _VitalBadge extends StatelessWidget {
  final IconData icon;
  final String value;
  final Color color;

  const _VitalBadge({
    required this.icon,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
