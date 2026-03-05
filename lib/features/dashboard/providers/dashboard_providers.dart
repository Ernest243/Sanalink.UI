import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/core/network/dio_client.dart';
import 'package:sanalink/models/encounter_model.dart';

part 'dashboard_providers.g.dart';

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
      scheduled: json['scheduled'] ?? 0,
      completed: json['completed'] ?? 0,
      cancelled: json['cancelled'] ?? 0,
      totalPatients: json['totalPatients'] ?? 0,
      totalPrescriptions: json['totalPrescriptions'] ?? 0,
    );
  }

  static const empty = AppointmentAnalytics(
    totalAppointments: 0,
    scheduled: 0,
    completed: 0,
    cancelled: 0,
    totalPatients: 0,
    totalPrescriptions: 0,
  );
}

class StaffCount {
  final int doctors;
  final int nurses;

  const StaffCount({required this.doctors, required this.nurses});

  static const empty = StaffCount(doctors: 0, nurses: 0);
}

@riverpod
Future<AppointmentAnalytics> appointmentAnalytics(Ref ref) async {
  final dio = ref.read(dioProvider);
  try {
    final response = await dio.get('Appointment/analytics');
    return AppointmentAnalytics.fromJson(response.data);
  } catch (_) {
    return AppointmentAnalytics.empty;
  }
}

@riverpod
Future<StaffCount> activeStaffCount(Ref ref) async {
  final dio = ref.read(dioProvider);
  try {
    final response = await dio.get('Auth/active-staff-count');
    final data = response.data as Map<String, dynamic>;
    return StaffCount(
      doctors: data['doctors'] ?? 0,
      nurses: data['nurseCount'] ?? 0,
    );
  } catch (_) {
    return StaffCount.empty;
  }
}

@riverpod
Future<List<EncounterModel>> recentEncounters(Ref ref) async {
  final dio = ref.read(dioProvider);
  final response = await dio.get('Encounter');
  final data = response.data as List;
  return data
      .take(5)
      .map((e) => EncounterModel.fromJson(e))
      .toList();
}
