import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/features/admin/providers/admin_providers.dart';
import 'package:sanalink/models/staff_user_model.dart';
import 'package:sanalink/models/staff_registration_request.dart';

class StaffListView extends ConsumerWidget {
  const StaffListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staffState = ref.watch(staffListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion du Personnel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(staffListProvider),
          ),
        ],
      ),
      body: staffState.when(
        data: (staff) => _buildBody(context, ref, staff),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Erreur: $err')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showRegistrationDialog(context, ref),
        label: const Text('Ajouter un membre'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    List<StaffUserModel> staff,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return _buildDataTable(staff);
        } else {
          return _buildCardGrid(staff);
        }
      },
    );
  }

  Widget _buildDataTable(List<StaffUserModel> staff) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Card(
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text(
                'Nom Complet',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Rôle',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Département',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: staff
              .map(
                (s) => DataRow(
                  cells: [
                    DataCell(Text(s.fullName)),
                    DataCell(Text(s.email)),
                    DataCell(_buildRoleChip(s.role)),
                    DataCell(Text(s.department ?? 'N/A')),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildCardGrid(List<StaffUserModel> staff) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: staff.length,
      itemBuilder: (context, index) {
        final s = staff[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            title: Text(
              s.fullName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${s.email}\n${s.department ?? ""}\b'),
            isThreeLine: true,
            trailing: _buildRoleChip(s.role),
          ),
        );
      },
    );
  }

  Widget _buildRoleChip(String role) {
    Color color = Colors.grey;
    if (role == 'Admin') color = Colors.red;
    if (role == 'Doctor') color = Colors.blue;
    if (role == 'Nurse') color = Colors.green;
    if (role == 'DAF') color = Colors.purple;

    return Chip(
      label: Text(
        role,
        style: const TextStyle(fontSize: 10, color: Colors.white),
      ),
      backgroundColor: color,
      padding: EdgeInsets.zero,
    );
  }

  void _showRegistrationDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => const StaffRegistrationDialog(),
    );
  }
}

class StaffRegistrationDialog extends ConsumerStatefulWidget {
  const StaffRegistrationDialog({super.key});

  @override
  ConsumerState<StaffRegistrationDialog> createState() =>
      _StaffRegistrationDialogState();
}

class _StaffRegistrationDialogState
    extends ConsumerState<StaffRegistrationDialog> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';
  String _role = 'Doctor';
  String? _department;
  final int _facilityId = 1; // Mocké pour le moment

  final List<String> _roles = [
    'Admin',
    'Doctor',
    'Nurse',
    'DAF',
    'Pharmacist',
    'LabTech',
    'Accueil',
  ];
  final List<String> _departments = [
    'Général',
    'Ophtalmologie',
    'Gynécologie',
    'Cardiologie',
    'Pédiatrie',
    'Radiologie',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Inscrire un nouveau personnel'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Prénom'),
                onChanged: (v) => _firstName = v,
                validator: (v) => v?.isEmpty ?? true ? 'Requis' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nom de famille'),
                onChanged: (v) => _lastName = v,
                validator: (v) => v?.isEmpty ?? true ? 'Requis' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: (v) => _email = v,
                validator: (v) => v?.isEmpty ?? true ? 'Requis' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                onChanged: (v) => _password = v,
                validator: (v) => (v?.length ?? 0) < 6 ? 'Trop court' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _role,
                decoration: const InputDecoration(labelText: 'Rôle'),
                items: _roles
                    .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                    .toList(),
                onChanged: (v) => setState(() => _role = v!),
              ),
              if (_role == 'Doctor') ...[
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _department ?? _departments.first,
                  decoration: const InputDecoration(
                    labelText: 'Département / Spécialité',
                  ),
                  items: _departments
                      .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                      .toList(),
                  onChanged: (v) => _department = v,
                ),
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        ElevatedButton(onPressed: _submit, child: const Text('Enregistrer')),
      ],
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final request = StaffRegistrationRequest(
        firstName: _firstName,
        lastName: _lastName,
        email: _email,
        password: _password,
        role: _role,
        facilityId: _facilityId,
        department: _role == 'Doctor' ? _department : null,
      );

      await ref.read(staffListProvider.notifier).registerStaff(request);
      if (mounted) Navigator.pop(context);
    }
  }
}
