import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/models/staff_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sanalink/core/demo/demo_mode.dart';

part 'auth_service.g.dart';

class AuthState {
  final String? token;
  final StaffUserModel? user;

  const AuthState({this.token, this.user});

  bool get isAuthenticated =>
      user != null && token != null && (isDemoMode || !JwtDecoder.isExpired(token!));
}

@Riverpod(keepAlive: true)
class AuthService extends _$AuthService {
  static const _tokenKey = 'jwt_token';

  @override
  FutureOr<AuthState> build() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);

    if (token != null) {
      if (isDemoMode) {
        return AuthState(token: token, user: _getMockUser(token));
      }

      if (!JwtDecoder.isExpired(token)) {
        final decodedToken = JwtDecoder.decode(token);
        final user = StaffUserModel.fromJson(decodedToken);
        return AuthState(token: token, user: user);
      }
    }
    return const AuthState();
  }

  Future<void> login(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);

    StaffUserModel user;
    if (isDemoMode) {
      user = _getMockUser(token);
    } else {
      final decodedToken = JwtDecoder.decode(token);
      user = StaffUserModel.fromJson(decodedToken);
    }

    state = AsyncData(AuthState(token: token, user: user));
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    state = const AsyncData(AuthState());
  }

  /// utilisateur fictif pour la démo
  StaffUserModel _getMockUser(String token) {
    Map<String, dynamic> decoded = {};
    try {
      decoded = JwtDecoder.decode(token);
    } catch (_) {}

    final role = decoded['role'] ?? 'Doctor';
    final email = decoded['email'] ?? 'demo@sanalink.com';

    return StaffUserModel(
      id: "1",
      email: email,
      firstName: "Utilisateur",
      lastName: "Démo ($role)",
      role: role,
      facilityId: 1,
    );
  }
}