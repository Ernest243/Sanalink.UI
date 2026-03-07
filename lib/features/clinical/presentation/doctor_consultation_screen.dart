import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/features/clinical/providers/clinical_providers.dart';
import 'package:sanalink/models/encounter_model.dart';
import 'package:sanalink/theme/app_theme.dart';
import 'package:sanalink/features/patient/presentation/patient_dossier_view.dart';

class DoctorConsultationScreen extends ConsumerStatefulWidget {
  const DoctorConsultationScreen({super.key});

  @override
  ConsumerState<DoctorConsultationScreen> createState() =>
      _DoctorConsultationScreenState();
}

class _DoctorConsultationScreenState
    extends ConsumerState<DoctorConsultationScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<EncounterModel> _filter(List<EncounterModel> all) {
    if (_query.isEmpty) return all;
    final q = _query.toLowerCase();
    return all.where((e) =>
        e.patientName.toLowerCase().contains(q) ||
        e.chiefComplaint.toLowerCase().contains(q) ||
        e.encounterNumber.toLowerCase().contains(q)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final consultationsState = ref.watch(consultationListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Consultations Médicales (En cours)')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher par patient, motif, N° consultation…',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _query = '');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onChanged: (v) => setState(() => _query = v.trim()),
            ),
          ),
          Expanded(
            child: consultationsState.when(
              data: (encounters) {
                final filtered = _filter(encounters);
                if (filtered.isEmpty) {
                  return Center(
                    child: Text(_query.isEmpty
                        ? 'Aucun patient en attente de consultation.'
                        : 'Aucun résultat pour "$_query".'),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final enc = filtered[index];
                    return Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: AppTheme.primaryColor,
                          child: Icon(Icons.medical_services,
                              color: Colors.white),
                        ),
                        title: Text(enc.patientName,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          'Motif: ${enc.chiefComplaint}\nN°: ${enc.encounterNumber}',
                        ),
                        trailing:
                            const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () => _openDossier(context, enc),
                      ),
                    );
                  },
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (err, stack) =>
                  Center(child: Text('Erreur: $err')),
            ),
          ),
        ],
      ),
    );
  }

  void _openDossier(BuildContext context, EncounterModel encounter) {
    // Dans l'app réelle, on naviguerait vers /patient/{id}
    // Pour la demo, je montres comment le Docteur interagit avec le dossier
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: PatientDossierView(encounter: encounter),
        ),
      ),
    );
  }
}
