import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/features/encounter/data/encounter_repository.dart';
import 'package:sanalink/models/encounter_model.dart';
import 'package:sanalink/models/encounter_update_request.dart';
import 'package:sanalink/core/demo/demo_store.dart';

/// [MockEncounterRepository] lié au [DemoStore].
class MockEncounterRepository implements EncounterRepository {
  final _store = DemoStore.instance;

  @override
  Ref get ref => throw UnimplementedError();

  @override
  Future<List<EncounterModel>> getEncounters() async {
    await Future.delayed(const Duration(milliseconds: 300));
    // Retourne les Encounter en cours (Open/InProgress)
    return _store.encounters
        .where((e) => e.status == 'Open' || e.status == 'InProgress')
        .toList();
  }

  @override
  Future<List<EncounterModel>> getPatientEncounters(int patientId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    // Retourne tout l'historique d'un patient
    return _store.encounters.where((e) => e.patientId == patientId).toList();
  }

  @override
  Future<void> updateEncounter(int id, EncounterUpdateRequest request) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _store.encounters.indexWhere((e) => e.id == id);
    if (index != -1) {
      _store.encounters[index] = _store.encounters[index].copyWith(
        chiefComplaint:
            request.chiefComplaint ?? _store.encounters[index].chiefComplaint,
        updatedAt: DateTime.now(),
      );
    }
  }

  @override
  Future<EncounterModel> createEncounter(
    int patientId,
    String chiefComplaint, {
    String? vitals,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newId = _store.encounters.isEmpty
        ? 1
        : _store.encounters.map((e) => e.id).reduce((a, b) => a > b ? a : b) +
              1;
    final encounter = EncounterModel(
      id: newId,
      encounterNumber: 'ENC-${newId.toString().padLeft(4, '0')}',
      patientId: patientId,
      patientName: '',
      doctorName: 'Médecin Démo',
      status: 'Open',
      chiefComplaint: chiefComplaint,
      vitals: vitals,
      createdAt: DateTime.now(),
    );
    _store.encounters.add(encounter);
    return encounter;
  }

  @override
  Future<void> updateStatus(int id, String status) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final index = _store.encounters.indexWhere((e) => e.id == id);
    if (index != -1) {
      _store.encounters[index] = _store.encounters[index].copyWith(
        status: status,
        updatedAt: DateTime.now(),
        closedAt: status == 'Closed' ? DateTime.now() : null,
      );
    }
  }
}
