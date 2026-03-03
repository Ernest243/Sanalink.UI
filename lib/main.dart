import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/theme/app_theme.dart';
import 'package:sanalink/theme/theme_provider.dart';
import 'package:sanalink/core/routing/app_router.dart';

import 'package:sanalink/core/demo/demo_mode.dart';
import 'package:sanalink/core/demo/mocks/mock_clinical_repository.dart';
import 'package:sanalink/core/demo/mocks/mock_lab_repository.dart';
import 'package:sanalink/core/demo/mocks/mock_pharmacy_repository.dart';
import 'package:sanalink/core/demo/mocks/mock_admin_repository.dart';
import 'package:sanalink/core/demo/mocks/mock_encounter_repository.dart';
import 'package:sanalink/features/clinical/data/clinical_repository.dart';
import 'package:sanalink/features/laboratory/data/lab_repository.dart';
import 'package:sanalink/features/pharmacy/data/pharmacy_repository.dart';
import 'package:sanalink/features/admin/data/admin_repository.dart';
import 'package:sanalink/features/encounter/data/encounter_repository.dart';

void main() async {
  // Assure l'initialisation des plugins (SharedPreferences, etc.)
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      overrides: isDemoMode
          ? [
        clinicalRepositoryProvider.overrideWithValue(
          MockClinicalRepository(),
        ),
        labRepositoryProvider.overrideWithValue(MockLabRepository()),
        pharmacyRepositoryProvider.overrideWithValue(
          MockPharmacyRepository(),
        ),
        adminRepositoryProvider.overrideWithValue(MockAdminRepository()),
        encounterRepositoryProvider.overrideWithValue(
          MockEncounterRepository(),
        ),
      ]
          : [],
      child: const SanalinkApp(),
    ),
  );
}

class SanalinkApp extends ConsumerWidget {
  const SanalinkApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Sanalink',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}