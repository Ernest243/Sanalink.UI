import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sanalink/core/auth/auth_service.dart';
import 'package:sanalink/features/auth/presentation/login_screen.dart';
import 'package:sanalink/core/presentation/main_layout.dart';
import 'package:sanalink/features/dashboard/presentation/dashboard_screen.dart';
import 'package:sanalink/features/encounter/presentation/encounter_list_view.dart';
import 'package:sanalink/features/patient/presentation/patient_dossier_view.dart';
import 'package:sanalink/features/admin/presentation/staff_list_view.dart';
import 'package:sanalink/features/admin/presentation/facility_list_view.dart';
import 'package:sanalink/features/clinical/presentation/nurse_triage_screen.dart';
import 'package:sanalink/features/clinical/presentation/doctor_consultation_screen.dart';
import 'package:sanalink/features/laboratory/presentation/lab_order_list_view.dart';
import 'package:sanalink/features/pharmacy/presentation/pharmacy_dashboard.dart';
import 'package:sanalink/models/encounter_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

@riverpod
GoRouter appRouter(Ref ref) {
  final authStateProvider = ref.watch(authServiceProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/dashboard',
    redirect: (context, state) {
      if (authStateProvider is AsyncLoading) return null;

      final authState = authStateProvider.value;
      final isAuthenticated = authState?.isAuthenticated ?? false;
      final isLoggingIn = state.uri.path == '/login';

      if (!isAuthenticated && !isLoggingIn) {
        return '/login';
      }

      if (isAuthenticated && isLoggingIn) {
        return '/dashboard';
      }

      if (isAuthenticated) {
        final role = authState?.user?.role;
        final path = state.uri.path;

       // Redirections RBAC strictes
        if (path.startsWith('/admin') && role != 'Admin') {
          return '/dashboard';
        }
        if (path.startsWith('/nurse') && role != 'Nurse' && role != 'Admin') {
          return '/dashboard';
        }
        if (path.startsWith('/doctor') && role != 'Doctor' && role != 'Admin') {
          return '/dashboard';
        }
        if (path.startsWith('/lab') && role != 'LabTech' && role != 'Admin') {
          return '/dashboard';
        }
        if (path.startsWith('/pharmacy') &&
            role != 'Pharmacist' &&
            role != 'Admin') {
          return '/dashboard';
        }
      }

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainLayout(child: child);
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/encounters',
            builder: (context, state) => const EncounterListView(),
          ),
          GoRoute(
            path: '/patient/:id',
            builder: (context, state) {
              // Note: Dans une navigation directe via URL, on aura que l'ID.
              // Mais GoRouter permet de passer des objets via 'extra' si nécessaire.
              // Pour simplifier l'exercice et la liaison de données, on va adapter l'ouverture depuis le tableau de bord du docteur.
              final id = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
              final encounter = state.extra as EncounterModel?;

              if (encounter != null) {
                return PatientDossierView(encounter: encounter);
              }

              // Fallback si navigation directe (ID seul)
              return PatientDossierView(patientId: id);
            },
          ),
          // Administratif
          GoRoute(
            path: '/admin/staff',
            builder: (context, state) => const StaffListView(),
          ),
          GoRoute(
            path: '/admin/facilities',
            builder: (context, state) => const FacilityListView(),
          ),
          // Clinique
          GoRoute(
            path: '/nurse/triage',
            builder: (context, state) => const NurseTriageScreen(),
          ),
          GoRoute(
            path: '/doctor/consultations',
            builder: (context, state) => const DoctorConsultationScreen(),
          ),
          // Laboratoire & pharmacie
          GoRoute(
            path: '/lab/orders',
            builder: (context, state) => const LabOrderListView(),
          ),
          GoRoute(
            path: '/pharmacy/dispense',
            builder: (context, state) => const PharmacyDashboard(),
          ),
        ],
      ),
    ],
  );
}
