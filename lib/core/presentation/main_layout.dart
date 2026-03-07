import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sanalink/core/auth/auth_service.dart';
import 'package:sanalink/core/presentation/admin_layout.dart';
import 'package:sanalink/theme/app_theme.dart';
import 'package:sanalink/theme/theme_provider.dart';

class MainLayout extends ConsumerWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final authState = ref.watch(authServiceProvider).value;
    final user = authState?.user;
    final role = user?.role ?? '';

    if (role == 'Admin') return AdminLayout(child: child);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.local_hospital, color: AppTheme.primaryColor),
            const SizedBox(width: 12),
            const Text(
              'Sanalink HIS',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: AppTheme.primaryColor,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.person_outline,
                  size: 20,
                  color: AppTheme.primaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  user?.email ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    role,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
            ),
            tooltip: 'Basculer le thème',
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: AppTheme.errorColor),
            tooltip: 'Déconnexion',
            onPressed: () => ref.read(authServiceProvider.notifier).logout(),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Row(
        children: [
          _buildNavigationRail(context, role),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationRail(BuildContext context, String role) {
    // URI actuel pour mettre en évidence l'index sélectionné
    final String location = GoRouterState.of(context).uri.path;

    // Éléments de menu filtrés RBAC
    final List<_NavItem> allItems = [
      _NavItem(
        label: 'Tableau de bord',
        icon: Icons.dashboard,
        route: '/dashboard',
      ),
      if (role == 'Admin' || role == 'DAF' || role == 'Accueil')
        _NavItem(
          label: 'Consultations',
          icon: Icons.calendar_today,
          route: '/encounters',
        ),
      if (role == 'Nurse')
        _NavItem(
          label: 'Tri Infirmier',
          icon: Icons.monitor_heart,
          route: '/nurse/triage',
        ),
      if (role == 'Doctor')
        _NavItem(
          label: 'Consultations Médicales',
          icon: Icons.medical_services,
          route: '/doctor/consultations',
        ),
      if (role == 'Admin') ...[
        _NavItem(label: 'Personnel', icon: Icons.people, route: '/admin/staff'),
        _NavItem(
          label: 'Établissements',
          icon: Icons.business,
          route: '/admin/facilities',
        ),
      ],
      if (role == 'LabTech' || role == 'Admin')
        _NavItem(
          label: 'Laboratoire',
          icon: Icons.science,
          route: '/lab/orders',
        ),
      if (role == 'Pharmacist' || role == 'Admin')
        _NavItem(
          label: 'Pharmacie',
          icon: Icons.local_pharmacy,
          route: '/pharmacy/dispense',
        ),
    ];

    int selectedIndex = allItems.indexWhere(
      (item) => location.startsWith(item.route),
    );
    if (selectedIndex == -1) selectedIndex = 0; // PAR DEFAUT

    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) {
        context.go(allItems[index].route);
      },
      extended: true,
      minExtendedWidth: 250,
      backgroundColor: Theme.of(context).cardColor,
      selectedIconTheme: const IconThemeData(color: AppTheme.primaryColor),
      unselectedIconTheme: IconThemeData(color: Colors.grey[600]),
      selectedLabelTextStyle: const TextStyle(
        color: AppTheme.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelTextStyle: TextStyle(color: Colors.grey[600]),
      destinations: allItems.map((item) {
        return NavigationRailDestination(
          icon: Icon(item.icon),
          selectedIcon: Icon(item.icon, color: AppTheme.primaryColor),
          label: Text(item.label),
        );
      }).toList(),
    );
  }
}

class _NavItem {
  final String label;
  final IconData icon;
  final String route;

  _NavItem({required this.label, required this.icon, required this.route});
}
