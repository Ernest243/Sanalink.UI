import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/core/auth/auth_service.dart';
import 'package:sanalink/features/pharmacy/providers/pharmacy_providers.dart';
import 'package:sanalink/models/prescription_model.dart';
import 'package:sanalink/models/pharmacy_dispense_model.dart';

class PharmacyDashboard extends ConsumerWidget {
  const PharmacyDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pharmacie : Gestion des Dispenses'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Ordonnances en attente',
                icon: Icon(Icons.pending_actions),
              ),
              Tab(text: 'Historique des dispenses', icon: Icon(Icons.history)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [_PendingPrescriptionsList(), _DispenseHistoryList()],
        ),
      ),
    );
  }
}

class _PendingPrescriptionsList extends ConsumerWidget {
  const _PendingPrescriptionsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prescriptionsState = ref.watch(pendingPrescriptionsProvider);

    return prescriptionsState.when(
      data: (list) {
        if (list.isEmpty) {
          return const Center(child: Text('Aucune ordonnance en attente.'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(24),
          itemCount: list.length,
          itemBuilder: (context, index) {
            final p = list[index];
            return Card(
              child: ListTile(
                title: Text(
                  p.medicationName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Dosage: ${p.dosage}\nPrescrit par: ${p.doctorName}',
                ),
                trailing: ElevatedButton(
                  onPressed: () => _showDispenseDialog(context, ref, p),
                  child: const Text('Dispenser'),
                ),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Erreur: $err')),
    );
  }

  void _showDispenseDialog(
    BuildContext context,
    WidgetRef ref,
    PrescriptionModel prescription,
  ) {
    showDialog(
      context: context,
      builder: (context) =>
          _DispenseMedicationDialog(prescription: prescription),
    );
  }
}

class _DispenseHistoryList extends ConsumerWidget {
  const _DispenseHistoryList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyState = ref.watch(dispenseHistoryProvider);
    final authState = ref.watch(authServiceProvider).value;

    if (authState?.isAuthenticated == false) {
      return const Center(child: Text('Non authentifié'));
    }

    final user = authState?.user;
    if (user?.role != 'Pharmacist' && user?.role != 'Admin') {
      return const Center(child: Text('Accès refusé'));
    }

    return historyState.when(
      data: (list) {
        if (list.isEmpty) {
          return const Center(child: Text('Aucun historique.'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(24),
          itemCount: list.length,
          itemBuilder: (context, index) {
            final h = list[index];
            return Card(
              child: ListTile(
                title: Text('Dispense #${h.id}'),
                subtitle: Text(
                  'Quantité: ${h.quantityDispensed}\nNotes: ${h.notes ?? ""}',
                ),
                trailing: Text(
                  h.status,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Erreur: $err')),
    );
  }
}

class _DispenseMedicationDialog extends ConsumerStatefulWidget {
  final PrescriptionModel prescription;
  const _DispenseMedicationDialog({required this.prescription});

  @override
  ConsumerState<_DispenseMedicationDialog> createState() =>
      _DispenseMedicationDialogState();
}

class _DispenseMedicationDialogState
    extends ConsumerState<_DispenseMedicationDialog> {
  final _formKey = GlobalKey<FormState>();
  int _quantity = 1;
  String _notes = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Dispensation : ${widget.prescription.medicationName}'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Quantité à dispenser',
              ),
              keyboardType: TextInputType.number,
              onChanged: (v) => _quantity = int.tryParse(v) ?? 0,
              validator: (v) =>
                  (int.tryParse(v ?? "") ?? 0) <= 0 ? 'Requis' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Notes de dispensation',
              ),
              maxLines: 2,
              onChanged: (v) => _notes = v,
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
          child: const Text('Confirmer la dispensation'),
        ),
      ],
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final request = PharmacyDispenseCreateRequest(
        prescriptionId: widget.prescription.id,
        quantityDispensed: _quantity,
        notes: _notes,
      );

      await ref.read(dispenseHistoryProvider.notifier).dispense(request);
      if (mounted) Navigator.pop(context);
    }
  }
}
