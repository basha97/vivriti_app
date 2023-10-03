import 'package:vivriti_app/models/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getProducts();
}
