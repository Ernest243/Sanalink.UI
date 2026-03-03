import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/features/clinical/providers/clinical_providers.dart';
import 'package:sanalink/models/encounter_model.dart';
import 'package:sanalink/theme/app_theme.dart';
import 'package:sanalink/features/patient/presentation/patient_dossier_view.dart';

class DoctorConsultationScreen extends ConsumerWidget {
  const DoctorConsultationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consultationsState = ref.watch(consultationListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Consultations Médicales (En cours)')),
      body: consultationsState.when(
        data: (encounters) => _buildList(context, ref, encounters),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Erreur: $err')),
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    WidgetRef ref,
    List<EncounterModel> encounters,
  ) {
    if (encounters.isEmpty) {
      return const Center(
        child: Text('Aucun patient en attente de consultation.'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: encounters.length,
      itemBuilder: (context, index) {
        final enc = encounters[index];
        return Card(
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: AppTheme.primaryColor,
              child: Icon(Icons.medical_services, color: Colors.white),
            ),
            title: Text(
              enc.patientName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Motif: ${enc.chiefComplaint}\nN°: ${enc.encounterNumber}',
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _openDossier(context, enc),
          ),
        );
      },
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
