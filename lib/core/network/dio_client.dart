import 'package:dio/dio.dart';

import 'interceptors/logging_interceptor.dart';

/// Dio HTTP 客户端
class DioClient {
  DioClient._();

  static final instance = DioClient._();

  late final Dio _dio = _createDio();

  Dio get dio => _dio;

  Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: '', // 设置你的 API base URL
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      LoggingInterceptor(),
      // AuthInterceptor(),
    ]);

    return dio;
  }
}
