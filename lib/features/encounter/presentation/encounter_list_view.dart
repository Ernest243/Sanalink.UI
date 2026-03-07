import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/core/auth/auth_service.dart';
import 'package:sanalink/core/network/dio_client.dart';
import 'package:sanalink/features/encounter/providers/encounter_provider.dart';
import 'package:sanalink/models/encounter_model.dart';

class EncounterListView extends ConsumerStatefulWidget {
  const EncounterListView({super.key});

  @override
  ConsumerState<EncounterListView> createState() => _EncounterListViewState();
}

class _EncounterListViewState extends ConsumerState<EncounterListView> {
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
        e.doctorName.toLowerCase().contains(q) ||
        e.chiefComplaint.toLowerCase().contains(q) ||
        e.encounterNumber.toLowerCase().contains(q) ||
        e.status.toLowerCase().contains(q)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final encountersState = ref.watch(encounterProvider);
    final authState = ref.watch(authServiceProvider);
    final role = authState.value?.user?.role;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Consultations en cours',
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
            child: encountersState.when(
              data: (encounters) {
                final filtered = _filter(encounters);
                if (filtered.isEmpty) {
                  return Center(
                    child: Text(_query.isEmpty
                        ? 'Aucune consultation trouvée.'
                        : 'Aucun résultat pour "$_query".'),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async => ref.invalidate(encounterProvider),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 800) {
                        return _buildDataTable(context, filtered);
                      } else {
                        return _buildCardGrid(context, filtered);
                      }
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Text(
                  'Erreur lors du chargement:\n$error',
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: role == 'Doctor'
          ? FloatingActionButton.extended(
              onPressed: () => _showCreateDialog(context),
              label: const Text('Nouvelle consultation'),
              icon: const Icon(Icons.add),
            )
          : null,
    );
  }

  void _showCreateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const EncounterCreateDialog(),
    );
  }

  Widget _buildDataTable(
    BuildContext context,
    List<EncounterModel> encounters,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Card(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(
                label: Text(
                  'N° Consultation',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Patient',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Docteur',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Maux (Motif)',
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
            rows: encounters.map((enc) {
              return DataRow(
                cells: [
                  DataCell(Text(enc.encounterNumber)),
                  DataCell(
                    Text(
                      enc.patientName,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  DataCell(Text(enc.doctorName)),
                  DataCell(Text(enc.chiefComplaint)),
                  DataCell(_buildStatusBadge(enc.status)),
                  DataCell(_buildActionDropdown(enc)),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildCardGrid(
    BuildContext context,
    List<EncounterModel> encounters,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: encounters.length,
      itemBuilder: (context, index) {
        final enc = encounters[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      enc.encounterNumber,
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: Colors.grey),
                    ),
                    _buildStatusBadge(enc.status),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  enc.patientName,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.medical_services,
                      size: 16,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 8),
                    Text('Médecin: ${enc.doctorName}'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.speaker_notes,
                      size: 16,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text('Motif: ${enc.chiefComplaint}')),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Modifier le statut: '),
                    const SizedBox(width: 12),
                    _buildActionDropdown(enc),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    String label;
    switch (status) {
      case 'Open':
        color = Colors.blue;
        label = 'Ouvert';
        break;
      case 'InProgress':
        color = Colors.orange;
        label = 'En cours';
        break;
      case 'Closed':
        color = Colors.green;
        label = 'Terminé';
        break;
      default:
        color = Colors.grey;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildActionDropdown(EncounterModel encounter) {
    return DropdownButton<String>(
      value: encounter.status,
      icon: const Icon(Icons.arrow_drop_down),
      underline: const SizedBox(),
      onChanged: (String? newValue) {
        if (newValue != null && newValue != encounter.status) {
          ref
              .read(encounterProvider.notifier)
              .updateStatus(encounter.id, newValue);
        }
      },
      items: const [
        DropdownMenuItem(value: 'Open', child: Text('Ouvert')),
        DropdownMenuItem(value: 'InProgress', child: Text('En cours')),
        DropdownMenuItem(value: 'Closed', child: Text('Terminé')),
      ],
    );
  }
}

class EncounterCreateDialog extends ConsumerStatefulWidget {
  const EncounterCreateDialog({super.key});

  @override
  ConsumerState<EncounterCreateDialog> createState() =>
      _EncounterCreateDialogState();
}

class _EncounterCreateDialogState extends ConsumerState<EncounterCreateDialog> {
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();
  final _complaintController = TextEditingController();
  final _vitalsController = TextEditingController();

  Timer? _debounce;
  List<Map<String, dynamic>> _searchResults = [];
  bool _searching = false;
  Map<String, dynamic>? _selectedPatient;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _complaintController.dispose();
    _vitalsController.dispose();
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

  void _selectPatient(Map<String, dynamic> patient) {
    setState(() {
      _selectedPatient = patient;
      _searchResults = [];
      _searchController.clear();
    });
  }

  void _clearPatient() {
    setState(() => _selectedPatient = null);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedPatient == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez sélectionner un patient.')),
      );
      return;
    }

    final patientId = _selectedPatient!['id'] as int;
    final chiefComplaint = _complaintController.text.trim();
    final vitals = _vitalsController.text.trim().isEmpty
        ? null
        : _vitalsController.text.trim();

    try {
      await ref
          .read(encounterProvider.notifier)
          .createEncounter(patientId, chiefComplaint, vitals: vitals);
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

  String _patientDisplayName(Map<String, dynamic> p) {
    final first = p['firstName'] ?? p['first_name'] ?? '';
    final last = p['lastName'] ?? p['last_name'] ?? '';
    final name = '$first $last'.trim();
    return name.isNotEmpty ? name : (p['name'] ?? 'Patient #${p['id']}');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nouvelle consultation'),
      content: SizedBox(
        width: 480,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_selectedPatient != null)
                  Chip(
                    label: Text(_patientDisplayName(_selectedPatient!)),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: _clearPatient,
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
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (_searchResults.isNotEmpty)
                    Container(
                      constraints: const BoxConstraints(maxHeight: 200),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final p = _searchResults[index];
                          return ListTile(
                            dense: true,
                            title: Text(_patientDisplayName(p)),
                            onTap: () => _selectPatient(p),
                          );
                        },
                      ),
                    ),
                ],
                const SizedBox(height: 16),
                TextFormField(
                  controller: _complaintController,
                  decoration: const InputDecoration(
                    labelText: 'Motif de la consultation',
                  ),
                  validator: (v) =>
                      v?.trim().isEmpty ?? true ? 'Requis' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _vitalsController,
                  decoration: const InputDecoration(
                    labelText: 'Signes vitaux (optionnel)',
                    hintText: 'TA: 120/80, FC: 72, Temp: 37.5C',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Créer'),
        ),
      ],
    );
  }
}
