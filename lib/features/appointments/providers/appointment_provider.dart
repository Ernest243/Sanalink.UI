import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/features/appointments/data/appointment_repository.dart';
import 'package:sanalink/models/appointment_model.dart';

part 'appointment_provider.g.dart';

@riverpod
class AppointmentList extends _$AppointmentList {
  @override
  Future<List<AppointmentModel>> build() {
    return ref.watch(appointmentRepositoryProvider).getAppointments();
  }

  Future<void> create({
    required int patientId,
    required String doctorId,
    required DateTime date,
    required String reason,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(appointmentRepositoryProvider).createAppointment(
            patientId: patientId,
            doctorId: doctorId,
            date: date,
            reason: reason,
          );
      return ref.read(appointmentRepositoryProvider).getAppointments();
    });
  }

  Future<void> cancel(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(appointmentRepositoryProvider).cancelAppointment(id);
      return ref.read(appointmentRepositoryProvider).getAppointments();
    });
  }
}
