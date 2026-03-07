import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sanalink/core/auth/auth_service.dart';
import 'package:sanalink/theme/theme_provider.dart';

/// Shell layout for Admin users.
/// Replaces [MainLayout] with a dark sidebar and a clean content area.
class AdminLayout extends ConsumerWidget {
  final Widget child;
  const AdminLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPath = GoRouterState.of(context).uri.path;
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      body: Row(
        children: [
          _AdminSidebar(currentPath: currentPath),
          const VerticalDivider(width: 1, thickness: 1, color: Color(0xFFE2E8F0)),
          Expanded(child: child),
        ],
      ),
    );
  }
}

// ─── Navigation data ──────────────────────────────────────────────────────

class _NavItem {
  final String label;
  final IconData icon;
  final String route;
  const _NavItem(this.label, this.icon, this.route);
}

class _NavSection {
  final String? header;
  final List<_NavItem> items;
  const _NavSection({this.header, required this.items});
}

final _navSections = [
  _NavSection(items: [
    _NavItem('Tableau de bord', Icons.dashboard_rounded, '/dashboard'),
  ]),
  _NavSection(header: 'Administration', items: [
    _NavItem('Personnel', Icons.people_rounded, '/admin/staff'),
    _NavItem('Établissements', Icons.business_rounded, '/admin/facilities'),
  ]),
  _NavSection(header: 'Modules', items: [
    _NavItem('Consultations', Icons.calendar_today_rounded, '/encounters'),
    _NavItem('Laboratoire', Icons.science_rounded, '/lab/orders'),
    _NavItem('Pharmacie', Icons.local_pharmacy_rounded, '/pharmacy/dispense'),
  ]),
];

// ─── Sidebar ──────────────────────────────────────────────────────────────

class _AdminSidebar extends ConsumerWidget {
  final String currentPath;
  const _AdminSidebar({required this.currentPath});

  static const _bg = Color(0xFF1B2559);
  static const _divider = Color(0xFF2D3A8C);
  static const _muted = Color(0xFFADB5C8);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return Container(
      width: 240,
      color: _bg,
      child: Column(
        children: [
          // ── Logo ──────────────────────────────────────────────────────
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.local_hospital,
                      color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sanalink',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          letterSpacing: 0.5,
                        )),
                    Text('Admin Console',
                        style: TextStyle(color: _muted, fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),

          const Divider(color: _divider, height: 1),

          // ── Nav items ─────────────────────────────────────────────────
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 12),
              children: _navSections.expand((section) sync* {
                if (section.header != null) {
                  yield Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 6),
                    child: Text(
                      section.header!.toUpperCase(),
                      style: const TextStyle(
                        color: _muted,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                  );
                }
                for (final item in section.items) {
                  yield _NavTile(
                    item: item,
                    isSelected: currentPath.startsWith(item.route),
                  );
                }
              }).toList(),
            ),
          ),

          // ── Bottom actions ────────────────────────────────────────────
          const Divider(color: _divider, height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                _SidebarAction(
                  icon: themeMode == ThemeMode.dark
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                  label: themeMode == ThemeMode.dark
                      ? 'Mode clair'
                      : 'Mode sombre',
                  onTap: () =>
                      ref.read(themeProvider.notifier).toggleTheme(),
                ),
                _SidebarAction(
                  icon: Icons.logout_rounded,
                  label: 'Déconnexion',
                  color: Colors.redAccent,
                  onTap: () =>
                      ref.read(authServiceProvider.notifier).logout(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Nav tile ─────────────────────────────────────────────────────────────

class _NavTile extends StatelessWidget {
  final _NavItem item;
  final bool isSelected;
  const _NavTile({required this.item, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Material(
        color: isSelected
            ? const Color(0xFF2D3A8C)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => context.go(item.route),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Icon(
                  item.icon,
                  size: 18,
                  color: isSelected
                      ? Colors.white
                      : const Color(0xFFADB5C8),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.label,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFFADB5C8),
                      fontSize: 13,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
                if (isSelected)
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Bottom sidebar action ────────────────────────────────────────────────

class _SidebarAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;
  const _SidebarAction({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final c = color ?? const Color(0xFFADB5C8);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(children: [
              Icon(icon, size: 18, color: c),
              const SizedBox(width: 12),
              Text(label, style: TextStyle(color: c, fontSize: 13)),
            ]),
          ),
        ),
      ),
    );
  }
}
