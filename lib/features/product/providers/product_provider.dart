import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vivriti_app/core/providers/dio_service_provider.dart';
import 'package:vivriti_app/features/product/repositories/product_interface.dart';
import 'package:vivriti_app/features/product/repositories/product_service.dart';
import 'package:vivriti_app/models/product.dart';

final productServiceProvider = Provider<IProductRepository>(
  (ref) {
    final httpService = ref.watch(dioHttpServiceProvider);
    return HttpProductService(httpService);
  },
);

final getProductsProvider = FutureProvider<List<Product>>((ref) async {
  final category = ref.watch(categoryProvider);
  final productService = ref.read(productServiceProvider);
  if (category != null) {
    final products = await productService.getProductsByCategory(category);
    return products;
  } else {
    final products = await productService.getProducts();
    return products;
  }
});

final getCategoriesProvider = FutureProvider<List<String>>((ref) async {
  final productService = ref.read(productServiceProvider);
  final categories = await productService.getCategories();
  return categories;
});

final categoryProvider = StateProvider<String?>((ref) => null);
