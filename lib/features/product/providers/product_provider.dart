import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vivriti_app/core/providers/dio_service_provider.dart';
import 'package:vivriti_app/features/product/repositories/product_interface.dart';
import 'package:vivriti_app/features/product/repositories/product_service.dart';

final productServiceProvider = Provider<IProductRepository>(
  (ref) {
    final httpService = ref.watch(dioHttpServiceProvider);
    return HttpProductService(httpService);
  },
);
