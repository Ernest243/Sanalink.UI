import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanalink/core/auth/auth_service.dart';
import 'package:sanalink/theme/app_theme.dart';
import 'dart:convert';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'doctor@sanalink.com');
  final _passwordController = TextEditingController(text: 'password123');
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await Future.delayed(const Duration(milliseconds: 800));

      String role = 'Doctor';
      if (_emailController.text.contains('admin')) role = 'Admin';
      if (_emailController.text.contains('nurse')) role = 'Nurse';

      // Ce payload doit contenir TOUS les champs requis par StaffUserModel
      // Si un modèle utilise 'id' comme String, mets "1". S'il utilise int, mets 1.
      final payload = {
        "id": "1", // Souvent un String (UUID) dans les modèles
        "email": _emailController.text,
        "fullName": "Utilisateur Démo",
        "role": role,
        "facilityId": "1",
        "token": "mock_token_string", // Parfois requis par le modèle
        "exp": DateTime.now().add(const Duration(hours: 4)).millisecondsSinceEpoch ~/ 1000,
      };

      final String header = base64UrlEncode(utf8.encode(jsonEncode({"alg": "HS256", "typ": "JWT"})));
      final String body = base64UrlEncode(utf8.encode(jsonEncode(payload)));
      final String signature = base64UrlEncode(utf8.encode('demo-signature'));

      final mockToken = '$header.$body.$signature';

      await ref.read(authServiceProvider.notifier).login(mockToken);

    } catch (e) {
      debugPrint('DÉTAIL ERREUR DÉMO: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur de mapping : Un champ requis est manquant ou nul.'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.local_hospital, size: 64, color: AppTheme.primaryColor),
                    const SizedBox(height: 16),
                    const Text(
                      'Sanalink',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
                    ),
                    const Text('Mode Démo Activé', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 32),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email (admin, doctor, nurse)',
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: _isLoading ? null : _handleLogin,
                        child: _isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('Se Connecter (Démo)', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}