import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/core/auth/auth_service.dart';

part 'dio_client.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final baseUrl = kReleaseMode
      ? 'https://sanalink-api.onrender.com/api/v1/'
      : 'http://localhost:5189/api/v1/';

  // Render free tier can take up to 60 s to wake from cold start.
  // Development keeps a tight 10 s timeout for fast feedback.
  final timeout = kReleaseMode
      ? const Duration(seconds: 60)
      : const Duration(seconds: 10);

  final instance = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: timeout,
      receiveTimeout: timeout,
    ),
  );

  instance.interceptors.add(AuthInterceptor(ref));

  return instance;
}

class AuthInterceptor extends Interceptor {
  final Ref ref;

  AuthInterceptor(this.ref);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      // Await the auth future so we never send a request without a token
      // while SharedPreferences is still loading on cold start.
      final authState = await ref.read(authServiceProvider.future);
      final token = authState.token;
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (_) {
      // Auth unavailable — proceed without header; onError handles 401.
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      ref.read(authServiceProvider.notifier).logout();
    }
    super.onError(err, handler);
  }
}
