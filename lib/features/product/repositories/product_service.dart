import 'package:vivriti_app/core/services/http/http_service.dart';
import 'package:vivriti_app/features/product/repositories/product_interface.dart';
import 'package:vivriti_app/models/product.dart';

class HttpProductService implements IProductRepository {
  HttpProductService(this.httpService);

  final HttpService httpService;

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await httpService.get('products');
      final data = response.data;
      final products = data['products'] as List;
      final result = List<Product>.from(
        products.map(
          (product) => Product.fromJson(product as Map<String, dynamic>),
        ),
      ).toList();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<String>> getCategories() async {
    try {
      final response = await httpService.get('products/categories');
      final data = response.data;
      final result = List<String>.from(
        data.map((category) => category),
      ).toList();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      final response = await httpService.get('products/category/$category');
      final data = response.data;
      final products = data['products'] as List;
      final result = List<Product>.from(
        products.map(
          (product) => Product.fromJson(product as Map<String, dynamic>),
        ),
      ).toList();
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
