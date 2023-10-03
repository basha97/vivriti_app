import 'package:dio/dio.dart';
import 'package:vivriti_app/core/configs/config.dart';
import 'package:vivriti_app/core/services/http/http_service.dart';

class DioHttpService implements HttpService {
  DioHttpService({Dio? dioOverride}) {
    dio = dioOverride ?? Dio(baseOptions);
    dio.interceptors.addAll(
      [
        LogInterceptor(
          requestHeader: false,
          responseHeader: false,
          requestBody: false,
          responseBody: false,
        )
      ],
    );
  }

  late final Dio dio;

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  String get baseUrl => Config.apiBaseUrl;

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json'
  };

  @override
  Future<Response<dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get<dynamic>(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
