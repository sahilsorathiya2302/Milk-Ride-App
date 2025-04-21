import 'package:dio/dio.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';

import '../core/secret/server_config.dart';

class DefaultInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[ServerConfig.contentType] = ServerConfig.applicationXWWW;
    options.headers[ServerConfig.accept] = ServerConfig.applicationJson;

    options.connectTimeout = const Duration(seconds: 200);
    options.sendTimeout = const Duration(seconds: 200);
    options.receiveTimeout = const Duration(seconds: 200);

    final String? token = StorageManager.readData("token");
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
