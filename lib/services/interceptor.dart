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
    //
    print(
        "===================================>$token"); // Ensure correct async handling
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }

    // print("🌍 [REQUEST] ${options.method}: ${options.uri}");
    // print("📩 Headers: ${options.headers}");
    // if (options.data != null) print("📦 Body: ${options.data}");

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // print("✅ [RESPONSE] ${response.statusCode}: ${response.realUri}");
    // print("📤 Data: ${response.data}");

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // print("❌ [ERROR] ${err.response?.statusCode}: ${err.message}");
    // print("📝 Response: ${err.response?.data}");

    handler.next(err);
  }
}
