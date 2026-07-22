import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.options.baseUrl = 'https://accessories-eshop.runasp.net/api';
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data}) {
    return dio.post(path, data: data);
  }

  Future<Response> put(String path, {dynamic data}) {
    return dio.put(path, data: data);
  }

  Future<Response> delete(String path) {
    return dio.delete(path);
  }
}
