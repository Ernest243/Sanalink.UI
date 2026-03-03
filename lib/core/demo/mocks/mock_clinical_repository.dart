import 'package:sanalink/features/clinical/data/clinical_repository.dart';
import 'package:sanalink/models/encounter_model.dart';
import 'package:sanalink/core/demo/demo_store.dart';

/// [MockClinicalRepository] utilise le [DemoStore] pour simuler les opérations cliniques.
/// Il inclut une logique de synchronisation pour le laboratoire et la pharmacie.
class MockClinicalRepository implements ClinicalRepository {
  final _store = DemoStore.instance;

  @override
  Future<List<EncounterModel>> getEncounters({String? status}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (status != null) {
      return _store.encounters.where((e) => e.status == status).toList();
    }
    return _store.encounters;
  }

  @override
  Future<void> updateVitals(int id, Map<String, dynamic> vitals) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _store.encounters.indexWhere((e) => e.id == id);
    if (index != -1) {
      final old = _store.encounters[index];
      final vitalsStr = vitals.entries
          .map((e) => '${e.key}: ${e.value}')
          .join(', ');
      _store.encounters[index] = old.copyWith(
        vitals: vitalsStr,
        updatedAt: DateTime.now(),
      );
    }
  }

  @override
  Future<void> updateStatus(int id, String status) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _store.encounters.indexWhere((e) => e.id == id);
    if (index != -1) {
      _store.encounters[index] = _store.encounters[index].copyWith(
        status: status,
        updatedAt: DateTime.now(),
        closedAt: status == 'Closed' ? DateTime.now() : null,
      );
    }
  }

  @override
  Future<void> saveConsultation(int id, String diagnosis, String notes) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _store.encounters.indexWhere((e) => e.id == id);
    if (index != -1) {
      _store.encounters[index] = _store.encounters[index].copyWith(
        diagnosis: diagnosis,
        clinicalNotes: notes,
        updatedAt: DateTime.now(),
      );

      // Simulation de l'intégration : Si les notes contiennent des mots clés,
      // Génère automatiquement des demandes labo ou pharmacie.
      final encounter = _store.encounters[index];
      _autoSyncWorkflows(encounter.patientId, notes, encounter.doctorName);
    }
  }

  @override
  Future<void> addNote(int patientId, String content) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _store.encounters.lastIndexWhere(
      (e) => e.patientId == patientId && e.status != 'Closed',
    );
    if (index != -1) {
      final oldNotes = _store.encounters[index].clinicalNotes ?? '';
      _store.encounters[index] = _store.encounters[index].copyWith(
        clinicalNotes: oldNotes.isEmpty ? content : '$oldNotes\n---\n$content',
        updatedAt: DateTime.now(),
      );
      _autoSyncWorkflows(
        patientId,
        content,
        _store.encounters[index].doctorName,
      );
    }
  }

  /// Déclenche des actions automatiques basées sur le contenu des notes.
  void _autoSyncWorkflows(int patientId, String text, String doctor) {
    final lowerText = text.toLowerCase();

    // Lab Sync
    if (lowerText.contains('nfs') || lowerText.contains('sang')) {
      _store.syncLabRequest(
        patientId,
        'NFS (Numération Formule Sanguine)',
        doctor,
      );
    }
    if (lowerText.contains('palu') || lowerText.contains('tdr')) {
      _store.syncLabRequest(patientId, 'Test Rapide Paludisme (TDR)', doctor);
    }

    // Pharmacy Sync
    if (lowerText.contains('paracétamol') || lowerText.contains('doliprane')) {
      _store.syncPrescription(
        patientId,
        'Paracétamol 1g',
        '1 comp x 3/j',
        doctor,
      );
    }
    if (lowerText.contains('amox')) {
      _store.syncPrescription(
        patientId,
        'Amoxicilline 500mg',
        '1 gélule x 3/j',
        doctor,
      );
    }
  }
}
