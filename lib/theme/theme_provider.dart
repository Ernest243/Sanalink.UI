import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeMode build() {
    return ThemeMode.system; // Par défaut, suit le système si l'user est en mode nuit et clair
  }

  /// Bascule entre le mode sombre et le mode clair
  void toggleTheme() {
    if (state == ThemeMode.light || state == ThemeMode.system) {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.light;
    }
  }

  /// Définit un mode spécifique
  void setTheme(ThemeMode mode) {
    state = mode;
  }
}
