import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/features/clinical/providers/clinical_providers.dart';
import 'package:sanalink/models/encounter_model.dart';

class NurseTriageScreen extends ConsumerStatefulWidget {
  const NurseTriageScreen({super.key});

  @override
  ConsumerState<NurseTriageScreen> createState() => _NurseTriageScreenState();
}

class _NurseTriageScreenState extends ConsumerState<NurseTriageScreen> {
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
        e.chiefComplaint.toLowerCase().contains(q)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final triageState = ref.watch(triageListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tri Infirmier (Attente de constantes)'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher par nom du patient ou motif…',
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
            child: triageState.when(
              data: (encounters) {
                final filtered = _filter(encounters);
                if (filtered.isEmpty) {
                  return Center(
                    child: Text(_query.isEmpty
                        ? 'Aucun patient en attente de tri.'
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
                        leading:
                            const CircleAvatar(child: Icon(Icons.person)),
                        title: Text(enc.patientName,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('Motif: ${enc.chiefComplaint}'),
                        trailing: ElevatedButton.icon(
                          onPressed: () =>
                              _showVitalsDialog(context, enc),
                          icon: const Icon(Icons.monitor_heart),
                          label: const Text('Prendre les constantes'),
                        ),
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

  void _showVitalsDialog(BuildContext context, EncounterModel encounter) {
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
