import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/core/network/dio_client.dart';
import 'package:sanalink/models/encounter_model.dart';
import 'package:sanalink/models/prescription_model.dart';

part 'dashboard_providers.g.dart';

// ── Data classes ──────────────────────────────────────────────────────────────

class AppointmentAnalytics {
  final int totalAppointments;
  final int scheduled;
  final int completed;
  final int cancelled;
  final int totalPatients;
  final int totalPrescriptions;

  const AppointmentAnalytics({
    required this.totalAppointments,
    required this.scheduled,
    required this.completed,
    required this.cancelled,
    required this.totalPatients,
    required this.totalPrescriptions,
  });

  factory AppointmentAnalytics.fromJson(Map<String, dynamic> json) {
    return AppointmentAnalytics(
      totalAppointments: json['totalAppointments'] ?? 0,
      scheduled:         json['scheduled']         ?? 0,
      completed:         json['completed']         ?? 0,
      cancelled:         json['cancelled']         ?? 0,
      totalPatients:     json['totalPatients']     ?? 0,
      totalPrescriptions: json['totalPrescriptions'] ?? 0,
    );
  }

  static const empty = AppointmentAnalytics(
    totalAppointments:  0,
    scheduled:          0,
    completed:          0,
    cancelled:          0,
    totalPatients:      0,
    totalPrescriptions: 0,
  );
}

class StaffCount {
  final int doctors;
  final int nurses;

  const StaffCount({required this.doctors, required this.nurses});

  static const empty = StaffCount(doctors: 0, nurses: 0);
}

class EncounterAnalytics {
  final int total;
  final int open;
  final int inProgress;
  final int closed;

  const EncounterAnalytics({
    required this.total,
    required this.open,
    required this.inProgress,
    required this.closed,
  });

  static const empty =
      EncounterAnalytics(total: 0, open: 0, inProgress: 0, closed: 0);
}

class AppointmentsPerDay {
  final List<String> dates;
  final List<int> counts;

  const AppointmentsPerDay({required this.dates, required this.counts});

  static const empty = AppointmentsPerDay(dates: [], counts: []);
}

// ── Providers ─────────────────────────────────────────────────────────────────

@riverpod
Future<AppointmentAnalytics> appointmentAnalytics(Ref ref) async {
  final dio = ref.watch(dioProvider);
  try {
    final response = await dio.get('Appointment/analytics');
    return AppointmentAnalytics.fromJson(response.data);
  } catch (_) {
    return AppointmentAnalytics.empty;
  }
}

@riverpod
Future<StaffCount> activeStaffCount(Ref ref) async {
  final dio = ref.watch(dioProvider);
  try {
    final response = await dio.get('Auth/active-staff-count');
    final data = response.data as Map<String, dynamic>;
    return StaffCount(
      doctors: data['doctors']    ?? 0,
      nurses:  data['nurseCount'] ?? 0,
    );
  } catch (_) {
    return StaffCount.empty;
  }
}

/// Single source-of-truth for all encounters on the dashboard.
/// Both [recentEncountersProvider] and [encounterAnalyticsProvider] derive
/// from this to avoid two separate heavy network calls.
@riverpod
Future<List<EncounterModel>> allEncounters(Ref ref) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get('Encounter');
  return (response.data as List)
      .map((e) => EncounterModel.fromJson(e))
      .toList();
}

@riverpod
Future<List<EncounterModel>> recentEncounters(Ref ref) async {
  try {
    final encounters = await ref.watch(allEncountersProvider.future);
    return encounters.take(5).toList();
  } catch (_) {
    return [];
  }
}

/// Computed client-side from [allEncountersProvider].
/// The API has no dedicated /Encounter/analytics endpoint.
@riverpod
Future<EncounterAnalytics> encounterAnalytics(Ref ref) async {
  try {
    final encounters = await ref.watch(allEncountersProvider.future);
    return EncounterAnalytics(
      total:      encounters.length,
      open:       encounters.where((e) => e.status == 'Open').length,
      inProgress: encounters.where((e) => e.status == 'InProgress').length,
      closed:     encounters.where((e) => e.status == 'Closed').length,
    );
  } catch (_) {
    return EncounterAnalytics.empty;
  }
}

@riverpod
Future<AppointmentsPerDay> appointmentsPerDay(Ref ref) async {
  final dio = ref.watch(dioProvider);
  try {
    final response = await dio.get('Appointment/appointments-per-day');
    final d = response.data as Map<String, dynamic>;
    return AppointmentsPerDay(
      dates:  List<String>.from(d['dates']  ?? []),
      counts: List<int>.from(d['counts'] ?? []),
    );
  } catch (_) {
    return AppointmentsPerDay.empty;
  }
}

@riverpod
Future<AppointmentsPerDay> patientRegistrations(Ref ref, int days) async {
  final dio = ref.watch(dioProvider);
  try {
    final response = await dio.get(
      'Patient/registrations',
      queryParameters: {'days': days},
    );
    final d = response.data as Map<String, dynamic>;
    return AppointmentsPerDay(
      dates:  List<String>.from(d['dates']  ?? []),
      counts: List<int>.from(d['counts'] ?? []),
    );
  } catch (_) {
    return AppointmentsPerDay.empty;
  }
}

/// Computed client-side from GET Prescriptions.
/// The API has no dedicated /Prescriptions/analytics endpoint.
@riverpod
Future<AppointmentsPerDay> prescriptionAnalytics(Ref ref, int days) async {
  final dio = ref.watch(dioProvider);
  try {
    final response = await dio.get('Prescriptions');
    final prescriptions = (response.data as List)
        .map((e) => PrescriptionModel.fromJson(e))
        .toList();

    final now   = DateTime.now().toUtc();
    final since = DateTime.utc(now.year, now.month, now.day)
        .subtract(Duration(days: days - 1));

    final counts = <DateTime, int>{};
    for (final p in prescriptions) {
      final day = DateTime.utc(
          p.createdAt.year, p.createdAt.month, p.createdAt.day);
      if (!day.isBefore(since)) {
        counts[day] = (counts[day] ?? 0) + 1;
      }
    }

    final allDates =
        List.generate(days, (i) => since.add(Duration(days: i)));

    return AppointmentsPerDay(
      dates: allDates
          .map((d) =>
              '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}')
          .toList(),
      counts: allDates.map((d) => counts[d] ?? 0).toList(),
    );
  } catch (_) {
    return AppointmentsPerDay.empty;
  }
}
