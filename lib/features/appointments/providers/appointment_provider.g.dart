// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppointmentList)
final appointmentListProvider = AppointmentListProvider._();

final class AppointmentListProvider
    extends $AsyncNotifierProvider<AppointmentList, List<AppointmentModel>> {
  AppointmentListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appointmentListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appointmentListHash();

  @$internal
  @override
  AppointmentList create() => AppointmentList();
}

String _$appointmentListHash() => r'679969f601b0dcc1ec7e94ab1a3970c02578821b';

abstract class _$AppointmentList
    extends $AsyncNotifier<List<AppointmentModel>> {
  FutureOr<List<AppointmentModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<AppointmentModel>>, List<AppointmentModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<AppointmentModel>>,
                List<AppointmentModel>
              >,
              AsyncValue<List<AppointmentModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
