import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/core/auth/auth_service.dart';

part 'dio_client.g.dart';

@riverpod
Dio dio(Ref ref) {
  final baseUrl = kReleaseMode
      ? 'https://sanalink-api.onrender.com/api/v1/'
      : 'http://localhost:5189/api/v1/';

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  dio.interceptors.add(AuthInterceptor(ref));

  return dio;
}

class AuthInterceptor extends Interceptor {
  final Ref ref;

  AuthInterceptor(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// Injecter le jeton s'il est disponible
    final authState = ref.read(authServiceProvider).value;
    final token = authState?.token;

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      /// Déclencher la déconnexion via le service d'authentification
      ref.read(authServiceProvider.notifier).logout();
    }
    super.onError(err, handler);
  }
}
