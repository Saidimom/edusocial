import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

class ApiClient {
  late final Dio dio;

  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://dummyjson.com",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        headers: {'Accept': 'application/json'},
      ),
    );

    final secureStorage = const FlutterSecureStorage();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await secureStorage.read(key: 'accessToken');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await secureStorage.delete(key: 'accessToken');
            await secureStorage.delete(key: 'refreshToken');
          }
          handler.next(error);
        },
      ),
    );
  }
}

@riverpod
ApiClient apiClient(Ref ref) {
  return ApiClient();
}
