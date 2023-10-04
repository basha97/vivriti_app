import 'package:flutter/material.dart';
import 'package:vivriti_app/features/product/view/product_item.dart';
import 'package:vivriti_app/models/product.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({Key? key, required this.products}) : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: products.isEmpty
          ? const Center(child: Text('No Product Found'))
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                mainAxisSpacing: 20,
                crossAxisSpacing: 15,
              ),
              itemCount: products.length,
              shrinkWrap: true,
              itemBuilder: (_, index) => ProductItem(product: products[index]),
            ),
    );
  }
}
