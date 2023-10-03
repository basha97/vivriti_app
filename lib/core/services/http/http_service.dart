import 'package:dio/dio.dart';

abstract class HttpService {
  String get baseUrl;

  Map<String, String> get headers;

  Future<Response<dynamic>> get(String endpoint,
      {Map<String, dynamic>? queryParameters});
}
