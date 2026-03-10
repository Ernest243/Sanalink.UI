import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/core/network/dio_client.dart';
import 'package:sanalink/models/appointment_model.dart';

part 'appointment_repository.g.dart';

class AppointmentRepository {
  final Dio _dio;

  AppointmentRepository(this._dio);

  Future<List<AppointmentModel>> getAppointments() async {
    final response = await _dio.get('/Appointment');
    return (response.data as List)
        .map((e) => AppointmentModel.fromJson(e))
        .toList();
  }

  Future<AppointmentModel> createAppointment({
    required int patientId,
    required String doctorId,
    required DateTime date,
    required String reason,
  }) async {
    final response = await _dio.post('/Appointment', data: {
      'patientId': patientId,
      'doctorId': doctorId,
      'date': date.toUtc().toIso8601String(),
      'reason': reason,
    });
    return AppointmentModel.fromJson(response.data);
  }

  Future<void> cancelAppointment(int id) async {
    await _dio.delete('/Appointment/$id');
  }
}

@riverpod
AppointmentRepository appointmentRepository(Ref ref) {
  return AppointmentRepository(ref.watch(dioProvider));
}
