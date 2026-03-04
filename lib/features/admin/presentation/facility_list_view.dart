import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/features/admin/providers/admin_providers.dart';
import 'package:sanalink/models/facility_model.dart';
import 'package:sanalink/theme/app_theme.dart';

class FacilityListView extends ConsumerWidget {
  const FacilityListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final facilityState = ref.watch(facilityListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Gestion des Établissements')),
      body: facilityState.when(
        data: (facilities) => _buildGrid(context, ref, facilities),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Erreur: $err')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateDialog(context, ref),
        label: const Text('Nouvel Établissement'),
        icon: const Icon(Icons.business_center),
      ),
    );
  }

  Widget _buildGrid(
    BuildContext context,
    WidgetRef ref,
    List<FacilityModel> facilities,
  ) {
    if (facilities.isEmpty) {
      return const Center(child: Text('Aucun établissement.'));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        childAspectRatio: 2.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: facilities.length,
      itemBuilder: (context, index) {
        final f = facilities[index];
        return Card(
          child: ListTile(
            leading: const Icon(
              Icons.local_hospital,
              size: 40,
              color: AppTheme.primaryColor,
            ),
            title: Text(
              f.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${f.type}\n${f.address}'),
            isThreeLine: true,
          ),
        );
      },
    );
  }

  void _showCreateDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => const _FacilityCreateDialog(),
    );
  }
}

class _FacilityCreateDialog extends ConsumerStatefulWidget {
  const _FacilityCreateDialog();

  @override
  ConsumerState<_FacilityCreateDialog> createState() =>
      _FacilityCreateDialogState();
}

class _FacilityCreateDialogState extends ConsumerState<_FacilityCreateDialog> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _address = '';
  String _type = 'Hôpital';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ajouter un établissement'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nom de l\'établissement',
              ),
              onChanged: (v) => _name = v,
              validator: (v) => v?.isEmpty ?? true ? 'Requis' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Adresse'),
              onChanged: (v) => _address = v,
              validator: (v) => v?.isEmpty ?? true ? 'Requis' : null,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: _type,
              items: [
                'Hôpital',
                'Clinique',
                'Centre de Santé',
                'Pharmacie',
              ].map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
              onChanged: (v) => _type = v!,
              decoration: const InputDecoration(labelText: 'Type'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        ElevatedButton(onPressed: _submit, child: const Text('Créer')),
      ],
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await ref
          .read(facilityListProvider.notifier)
          .createFacility(_name, _address, _type);
      if (mounted) Navigator.pop(context);
    }
  }
}
