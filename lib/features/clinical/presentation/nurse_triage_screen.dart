import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/features/clinical/providers/clinical_providers.dart';
import 'package:sanalink/models/encounter_model.dart';

class NurseTriageScreen extends ConsumerWidget {
  const NurseTriageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final triageState = ref.watch(triageListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tri Infirmier (Attente de constantes)'),
      ),
      body: triageState.when(
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
      return const Center(child: Text('Aucun patient en attente de tri.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: encounters.length,
      itemBuilder: (context, index) {
        final enc = encounters[index];
        return Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(
              enc.patientName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Motif: ${enc.chiefComplaint}'),
            trailing: ElevatedButton.icon(
              onPressed: () => _showVitalsDialog(context, ref, enc),
              icon: const Icon(Icons.monitor_heart),
              label: const Text('Prendre les constantes'),
            ),
          ),
        );
      },
    );
  }

  void _showVitalsDialog(
    BuildContext context,
    WidgetRef ref,
    EncounterModel encounter,
  ) {
    showDialog(
      context: context,
      builder: (context) => _VitalsDialog(encounter: encounter),
    );
  }
}

class _VitalsDialog extends ConsumerStatefulWidget {
  final EncounterModel encounter;
  const _VitalsDialog({required this.encounter});

  @override
  ConsumerState<_VitalsDialog> createState() => _VitalsDialogState();
}

class _VitalsDialogState extends ConsumerState<_VitalsDialog> {
  final _formKey = GlobalKey<FormState>();
  String _bp = '';
  String _temp = '';
  String _hr = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Constantes : ${widget.encounter.patientName}'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Tension Artérielle (mmHg)',
                hintText: '120/80',
              ),
              onChanged: (v) => _bp = v,
              validator: (v) => v?.isEmpty ?? true ? 'Requis' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Température (°C)',
                hintText: '37.5',
              ),
              keyboardType: TextInputType.number,
              onChanged: (v) => _temp = v,
              validator: (v) => v?.isEmpty ?? true ? 'Requis' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Fréquence Cardiaque (bpm)',
                hintText: '72',
              ),
              keyboardType: TextInputType.number,
              onChanged: (v) => _hr = v,
              validator: (v) => v?.isEmpty ?? true ? 'Requis' : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Valider et Envoyer au Docteur'),
        ),
      ],
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await ref.read(triageListProvider.notifier).submitVitals(
        widget.encounter.id,
        {'bloodPressure': _bp, 'temperature': _temp, 'heartRate': _hr},
      );
      if (mounted) Navigator.pop(context);
    }
  }
}
