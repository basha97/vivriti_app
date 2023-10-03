import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vivriti_app/core/services/http/dio_http_service.dart';
import 'package:vivriti_app/core/services/http/http_service.dart';

final dioHttpServiceProvider = Provider<HttpService>(
  (ref) => DioHttpService(),
);
