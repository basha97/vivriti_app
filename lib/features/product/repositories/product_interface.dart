import 'package:vivriti_app/models/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getProducts({String? search});

  Future<List<String>> getCategories();

  Future<List<Product>> getProductsByCategory(String category);
}
