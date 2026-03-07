import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/core/auth/auth_service.dart';
import 'package:sanalink/features/admin/providers/admin_providers.dart';
import 'package:sanalink/models/staff_user_model.dart';
import 'package:sanalink/models/staff_registration_request.dart';
import 'package:sanalink/theme/app_theme.dart';

class StaffListView extends ConsumerStatefulWidget {
  const StaffListView({super.key});

  @override
  ConsumerState<StaffListView> createState() => _StaffListViewState();
}

class _StaffListViewState extends ConsumerState<StaffListView> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<StaffUserModel> _filter(List<StaffUserModel> all) {
    if (_query.isEmpty) return all;
    final q = _query.toLowerCase();
    return all.where((s) =>
        s.fullName.toLowerCase().contains(q) ||
        s.email.toLowerCase().contains(q) ||
        s.role.toLowerCase().contains(q) ||
        (s.department ?? '').toLowerCase().contains(q)).toList();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher par nom, email, rôle, département…',
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
            child: staffState.when(
              data: (staff) {
                final filtered = _filter(staff);
                if (filtered.isEmpty) {
                  return Center(
                    child: Text(_query.isEmpty
                        ? 'Aucun personnel enregistré.'
                        : 'Aucun résultat pour "$_query".'),
                  );
                }
                return _buildBody(context, filtered);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Impossible de charger le personnel.\n$err',
                        textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => ref.invalidate(staffListProvider),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Réessayer'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showRegistrationDialog(context),
        label: const Text('Ajouter un membre'),
        icon: const Icon(Icons.person_add),
      ),
    );
  }

  Widget _buildBody(BuildContext context, List<StaffUserModel> staff) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return _buildDataTable(context, staff);
        } else {
          return _buildCardList(context, staff);
        }
      },
    );
  }

  Widget _buildDataTable(BuildContext context, List<StaffUserModel> staff) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Card(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Nom Complet', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Email', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Rôle', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Département', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Statut', style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: staff
              .map((s) => DataRow(
                    onSelectChanged: (_) => _openProfile(context, s),
                    cells: [
                      DataCell(Row(children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: _roleColor(s.role).withValues(alpha: 0.15),
                          child: Text(
                            s.firstName.isNotEmpty ? s.firstName[0].toUpperCase() : '?',
                            style: TextStyle(color: _roleColor(s.role), fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(s.fullName),
                      ])),
                      DataCell(Text(s.email)),
                      DataCell(_buildRoleChip(s.role)),
                      DataCell(Text(s.department ?? '—')),
                      DataCell(_buildStatusChip(s.isActive)),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildCardList(BuildContext context, List<StaffUserModel> staff) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: staff.length,
      itemBuilder: (context, index) {
        final s = staff[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            onTap: () => _openProfile(context, s),
            leading: CircleAvatar(
              backgroundColor: _roleColor(s.role).withValues(alpha: 0.15),
              child: Text(
                s.firstName.isNotEmpty ? s.firstName[0].toUpperCase() : '?',
                style: TextStyle(color: _roleColor(s.role), fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(s.fullName, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${s.email}\n${s.department ?? ""}'),
            isThreeLine: s.department != null,
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildRoleChip(s.role),
                const SizedBox(height: 4),
                _buildStatusChip(s.isActive),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openProfile(BuildContext context, StaffUserModel s) {
    showDialog(
      context: context,
      builder: (_) => _StaffProfileDialog(staff: s),
    );
  }

  Color _roleColor(String role) {
    switch (role) {
      case 'Admin':
        return Colors.red;
      case 'Doctor':
        return Colors.blue;
      case 'Nurse':
        return Colors.green;
      case 'Pharmacist':
        return Colors.orange;
      case 'LabTech':
        return Colors.purple;
      case 'DAF':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  Widget _buildRoleChip(String role) {
    return Chip(
      label: Text(role, style: const TextStyle(fontSize: 10, color: Colors.white)),
      backgroundColor: _roleColor(role),
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _buildStatusChip(bool isActive) {
    return Chip(
      label: Text(
        isActive ? 'Actif' : 'Inactif',
        style: const TextStyle(fontSize: 10, color: Colors.white),
      ),
      backgroundColor: isActive ? Colors.green : Colors.grey,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
    );
  }

  void _showRegistrationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const StaffRegistrationDialog(),
    );
  }
}

// ─── Staff Profile Dialog ──────────────────────────────────────────────────

class _StaffProfileDialog extends StatelessWidget {
  final StaffUserModel staff;
  const _StaffProfileDialog({required this.staff});

  @override
  Widget build(BuildContext context) {
    final color = _roleColor(staff.role);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.08),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: color.withValues(alpha: 0.2),
                    child: Text(
                      staff.firstName.isNotEmpty ? staff.firstName[0].toUpperCase() : '?',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          staff.fullName,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Chip(
                              label: Text(
                                staff.role,
                                style: const TextStyle(fontSize: 11, color: Colors.white),
                              ),
                              backgroundColor: color,
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                            ),
                            const SizedBox(width: 8),
                            Chip(
                              label: Text(
                                staff.isActive ? 'Actif' : 'Inactif',
                                style: const TextStyle(fontSize: 11, color: Colors.white),
                              ),
                              backgroundColor: staff.isActive ? Colors.green : Colors.grey,
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Details
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _ProfileRow(Icons.email, 'Email', staff.email),
                  const Divider(height: 20),
                  _ProfileRow(Icons.business_center, 'Département',
                      staff.department ?? 'Non assigné'),
                  const Divider(height: 20),
                  _ProfileRow(Icons.business, 'Établissement',
                      staff.facilityId != null ? 'Facility #${staff.facilityId}' : 'N/A'),
                  if (staff.createdAt != null) ...[
                    const Divider(height: 20),
                    _ProfileRow(
                      Icons.calendar_today,
                      'Membre depuis',
                      '${staff.createdAt!.day}/${staff.createdAt!.month}/${staff.createdAt!.year}',
                    ),
                  ],
                ],
              ),
            ),

            // Actions
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Fermer'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _roleColor(String role) {
    switch (role) {
      case 'Admin': return Colors.red;
      case 'Doctor': return Colors.blue;
      case 'Nurse': return Colors.green;
      case 'Pharmacist': return Colors.orange;
      case 'LabTech': return Colors.purple;
      case 'DAF': return Colors.teal;
      default: return Colors.grey;
    }
  }
}

class _ProfileRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProfileRow(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppTheme.primaryColor),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(fontSize: 11, color: Colors.grey)),
              const SizedBox(height: 2),
              Text(value,
                  style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Staff Registration Dialog ─────────────────────────────────────────────

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
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _department,
                decoration: const InputDecoration(
                  labelText: 'Département (optionnel)',
                ),
                items: _departments
                    .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                    .toList(),
                onChanged: (v) => _department = v,
              ),
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

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      final facilityId =
          ref.read(authServiceProvider).value?.user?.facilityId ?? 1;
      final request = StaffRegistrationRequest(
        firstName: _firstName,
        lastName: _lastName,
        email: _email,
        password: _password,
        role: _role,
        facilityId: facilityId,
        department: _department,
      );

      try {
        await ref.read(staffListProvider.notifier).registerStaff(request);
        if (mounted) Navigator.pop(context);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erreur: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}
