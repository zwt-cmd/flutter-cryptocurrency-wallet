import 'package:dio/dio.dart';

/// 认证拦截器
/// 自动添加 Authorization header
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: 从本地存储获取 token
    // final token = await storage.getToken();
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // TODO: 处理 token 过期，刷新 token 或跳转登录
    }
    handler.next(err);
  }
}
