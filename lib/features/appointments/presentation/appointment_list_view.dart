import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/core/auth/auth_service.dart';
import 'package:sanalink/core/network/dio_client.dart';
import 'package:sanalink/features/admin/providers/admin_providers.dart';
import 'package:sanalink/features/appointments/providers/appointment_provider.dart';
import 'package:sanalink/models/appointment_model.dart';
import 'package:sanalink/models/staff_user_model.dart';
import 'package:sanalink/theme/app_theme.dart';

class AppointmentListView extends ConsumerStatefulWidget {
  const AppointmentListView({super.key});

  @override
  ConsumerState<AppointmentListView> createState() =>
      _AppointmentListViewState();
}

class _AppointmentListViewState extends ConsumerState<AppointmentListView> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<AppointmentModel> _filter(List<AppointmentModel> all) {
    if (_query.isEmpty) return all;
    final q = _query.toLowerCase();
    return all
        .where((a) =>
            a.patientName.toLowerCase().contains(q) ||
            a.doctorName.toLowerCase().contains(q) ||
            a.reason.toLowerCase().contains(q) ||
            a.status.toLowerCase().contains(q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final appointmentsState = ref.watch(appointmentListProvider);
    final role = ref.watch(authServiceProvider).value?.user?.role ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rendez-vous',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher par patient, médecin, motif, statut…',
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
            child: appointmentsState.when(
              data: (appointments) {
                final filtered = _filter(appointments);
                if (filtered.isEmpty) {
                  return Center(
                    child: Text(_query.isEmpty
                        ? 'Aucun rendez-vous trouvé.'
                        : 'Aucun résultat pour "$_query".'),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async =>
                      ref.invalidate(appointmentListProvider),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 700) {
                        return _buildDataTable(context, filtered, role);
                      }
                      return _buildCardList(context, filtered, role);
                    },
                  ),
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(
                child: Text(
                  'Erreur: $err',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton:
          (role == 'Doctor' || role == 'Nurse' || role == 'Admin' || role == 'Accueil')
              ? FloatingActionButton.extended(
                  onPressed: () => _showCreateDialog(context),
                  label: const Text('Nouveau rendez-vous'),
                  icon: const Icon(Icons.add),
                )
              : null,
    );
  }

  void _showCreateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const AppointmentCreateDialog(),
    );
  }

  Widget _buildStatusBadge(String status) {
    final color = switch (status) {
      'Scheduled' => Colors.blue,
      'Completed' => Colors.green,
      'Cancelled' => Colors.red,
      _ => Colors.grey,
    };
    final label = switch (status) {
      'Scheduled' => 'Planifié',
      'Completed' => 'Terminé',
      'Cancelled' => 'Annulé',
      _ => status,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: color, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDataTable(
      BuildContext context, List<AppointmentModel> appointments, String role) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Card(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(
                  label: Text('Patient',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Médecin',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Date',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Motif',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Statut',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Actions',
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            rows: appointments.map((a) {
              return DataRow(cells: [
                DataCell(Text(a.patientName,
                    style: const TextStyle(fontWeight: FontWeight.w600))),
                DataCell(Text(a.doctorName)),
                DataCell(Text(
                    '${a.date.day.toString().padLeft(2, '0')}/${a.date.month.toString().padLeft(2, '0')}/${a.date.year} ${a.date.hour.toString().padLeft(2, '0')}:${a.date.minute.toString().padLeft(2, '0')}')),
                DataCell(Text(a.reason,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
                    showEditIcon: false),
                DataCell(_buildStatusBadge(a.status)),
                DataCell(_buildActionsButton(a, role)),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildCardList(
      BuildContext context, List<AppointmentModel> appointments, String role) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: appointments.length,
      itemBuilder: (_, i) {
        final a = appointments[i];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(a.patientName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    _buildStatusBadge(a.status),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Médecin: ${a.doctorName}',
                    style: const TextStyle(color: Colors.grey)),
                Text(
                    'Date: ${a.date.day.toString().padLeft(2, '0')}/${a.date.month.toString().padLeft(2, '0')}/${a.date.year}'),
                Text('Motif: ${a.reason}'),
                if (a.status == 'Scheduled' &&
                    (role == 'Doctor' ||
                        role == 'Admin' ||
                        role == 'Accueil'))
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      icon: const Icon(Icons.cancel_outlined,
                          color: Colors.red, size: 18),
                      label: const Text('Annuler',
                          style: TextStyle(color: Colors.red)),
                      onPressed: () => _confirmCancel(a),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionsButton(AppointmentModel a, String role) {
    if (a.status != 'Scheduled') return const SizedBox.shrink();
    if (role != 'Doctor' && role != 'Admin' && role != 'Accueil') {
      return const SizedBox.shrink();
    }
    return IconButton(
      icon: const Icon(Icons.cancel_outlined, color: Colors.red, size: 20),
      tooltip: 'Annuler le rendez-vous',
      onPressed: () => _confirmCancel(a),
    );
  }

  void _confirmCancel(AppointmentModel a) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Annuler le rendez-vous ?'),
        content:
            Text('Confirmer l\'annulation du RDV de ${a.patientName} ?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Non')),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(appointmentListProvider.notifier).cancel(a.id);
            },
            child:
                const Text('Oui', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class AppointmentCreateDialog extends ConsumerStatefulWidget {
  const AppointmentCreateDialog({super.key});

  @override
  ConsumerState<AppointmentCreateDialog> createState() =>
      _AppointmentCreateDialogState();
}

class _AppointmentCreateDialogState
    extends ConsumerState<AppointmentCreateDialog> {
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();
  final _reasonController = TextEditingController();

  Timer? _debounce;
  List<Map<String, dynamic>> _searchResults = [];
  bool _searching = false;
  Map<String, dynamic>? _selectedPatient;
  String? _selectedDoctorId;

  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  TimeOfDay _selectedTime = const TimeOfDay(hour: 9, minute: 0);

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _debounce?.cancel();
    if (query.trim().isEmpty) {
      setState(() => _searchResults = []);
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 400), () async {
      setState(() => _searching = true);
      try {
        final dio = ref.read(dioProvider);
        final response = await dio.get(
          'Patient/search',
          queryParameters: {'query': query.trim()},
        );
        final data = response.data as List;
        setState(() {
          _searchResults = data.cast<Map<String, dynamic>>();
          _searching = false;
        });
      } catch (_) {
        setState(() => _searching = false);
      }
    });
  }

  String _patientName(Map<String, dynamic> p) {
    final first = p['firstName'] ?? '';
    final last = p['lastName'] ?? '';
    return '$first $last'.trim().isNotEmpty
        ? '$first $last'.trim()
        : 'Patient #${p['id']}';
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) setState(() => _selectedTime = picked);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedPatient == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez sélectionner un patient.')),
      );
      return;
    }
    if (_selectedDoctorId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez sélectionner un médecin.')),
      );
      return;
    }

    final appointmentDate = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    try {
      await ref.read(appointmentListProvider.notifier).create(
            patientId: _selectedPatient!['id'] as int,
            doctorId: _selectedDoctorId!,
            date: appointmentDate,
            reason: _reasonController.text.trim(),
          );
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final staffAsync = ref.watch(staffListProvider);

    return AlertDialog(
      title: const Text('Nouveau rendez-vous'),
      content: SizedBox(
        width: 480,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Patient search
                if (_selectedPatient != null)
                  Chip(
                    label: Text(_patientName(_selectedPatient!)),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: () =>
                        setState(() => _selectedPatient = null),
                    backgroundColor:
                        AppTheme.primaryColor.withValues(alpha: 0.1),
                  )
                else ...[
                  TextFormField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      labelText: 'Rechercher un patient',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: _onSearchChanged,
                  ),
                  if (_searching)
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  if (_searchResults.isNotEmpty)
                    Container(
                      constraints: const BoxConstraints(maxHeight: 160),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _searchResults.length,
                        itemBuilder: (_, i) {
                          final p = _searchResults[i];
                          return ListTile(
                            dense: true,
                            title: Text(_patientName(p)),
                            onTap: () => setState(() {
                              _selectedPatient = p;
                              _searchResults = [];
                              _searchController.clear();
                            }),
                          );
                        },
                      ),
                    ),
                ],
                const SizedBox(height: 12),

                // Doctor dropdown
                staffAsync.when(
                  data: (staff) {
                    final doctors =
                        staff.where((s) => s.role == 'Doctor').toList();
                    return DropdownButtonFormField<String>(
                      key: ValueKey(_selectedDoctorId),
                      initialValue: _selectedDoctorId,
                      decoration:
                          const InputDecoration(labelText: 'Médecin'),
                      items: doctors
                          .map((d) => DropdownMenuItem(
                                value: d.id,
                                child: Text(d.fullName),
                              ))
                          .toList(),
                      onChanged: (v) =>
                          setState(() => _selectedDoctorId = v),
                      validator: (v) =>
                          v == null ? 'Champ requis' : null,
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (_, __) =>
                      const Text('Impossible de charger les médecins'),
                ),
                const SizedBox(height: 12),

                // Date and time
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.calendar_today, size: 16),
                        label: Text(
                            '${_selectedDate.day.toString().padLeft(2, '0')}/${_selectedDate.month.toString().padLeft(2, '0')}/${_selectedDate.year}'),
                        onPressed: _pickDate,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.access_time, size: 16),
                        label: Text(
                            '${_selectedTime.hour.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')}'),
                        onPressed: _pickTime,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Reason
                TextFormField(
                  controller: _reasonController,
                  decoration:
                      const InputDecoration(labelText: 'Motif du rendez-vous'),
                  maxLines: 2,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Champ requis' : null,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler')),
        FilledButton(
          onPressed: _submit,
          child: const Text('Confirmer'),
        ),
      ],
    );
  }
}
