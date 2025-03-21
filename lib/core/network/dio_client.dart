import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;
  DioClient() {
    _dio = Dio(BaseOptions(
      headers: {
        'Content-Type': 'application/json',
      },
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      responseType: ResponseType.json,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
  }

  Future<Response> get(String url) async {
    try {
      final Response response = await _dio.get(url);
      return response;
    } on DioException {
      rethrow;
    }
  }

  Future<Response> post(String url, {data}) async {
    try {
      final Response response = await _dio.post(url, data: data);
      return response;
    } on DioException {
      rethrow;
    }
  }
}
