import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/features/laboratory/providers/lab_providers.dart';
import 'package:sanalink/models/lab_order_model.dart';

class LabOrderListView extends ConsumerWidget {
  const LabOrderListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final labState = ref.watch(labOrderListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Laboratoire : Demandes d\'examens')),
      body: labState.when(
        data: (orders) => _buildBody(context, ref, orders),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Erreur: $err')),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    List<LabOrderModel> orders,
  ) {
    if (orders.isEmpty) {
      return const Center(child: Text('Aucune demande en attente.'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Card(
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text(
                'ID Patient',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Examen',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Demandé par',
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
          rows: orders
              .map(
                (o) => DataRow(
                  cells: [
                    DataCell(Text(o.patientId.toString())),
                    DataCell(Text(o.testName)),
                    DataCell(Text(o.requestedBy)),
                    DataCell(_buildStatusBadge(o.status)),
                    DataCell(
                      ElevatedButton(
                        onPressed: o.status != 'Completed'
                            ? () => _showResultDialog(context, ref, o)
                            : null,
                        child: const Text('Rendre résultat'),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color = Colors.grey;
    if (status == 'Pending') color = Colors.orange;
    if (status == 'Completed') color = Colors.green;
    if (status == 'SampleCollected') color = Colors.blue;

    return Chip(
      label: Text(
        status,
        style: const TextStyle(fontSize: 10, color: Colors.white),
      ),
      backgroundColor: color,
    );
  }

  void _showResultDialog(
    BuildContext context,
    WidgetRef ref,
    LabOrderModel order,
  ) {
    showDialog(
      context: context,
      builder: (context) => _LabResultDialog(order: order),
    );
  }
}

class _LabResultDialog extends ConsumerStatefulWidget {
  final LabOrderModel order;
  const _LabResultDialog({required this.order});

  @override
  ConsumerState<_LabResultDialog> createState() => _LabResultDialogState();
}

class _LabResultDialogState extends ConsumerState<_LabResultDialog> {
  final _formKey = GlobalKey<FormState>();
  String _result = '';
  String _notes = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Résultat d\'examen : ${widget.order.testName}'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Valeur / Résultat'),
              onChanged: (v) => _result = v,
              validator: (v) => v?.isEmpty ?? true ? 'Requis' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Notes complémentaires',
              ),
              maxLines: 3,
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
          child: const Text('Valider le résultat'),
        ),
      ],
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await ref
          .read(labOrderListProvider.notifier)
          .updateResult(widget.order.id, _result, _notes);
      if (mounted) Navigator.pop(context);
    }
  }
}
