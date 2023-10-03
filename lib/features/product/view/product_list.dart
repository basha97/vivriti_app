import 'package:flutter/material.dart';
import 'package:vivriti_app/models/product.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({Key? key, required this.products}) : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: products.length,
        itemBuilder: (_, index) {
          final product = products[index];
          return Container(
            height: 200,
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.red,
            child: Text('${product.title}'),
          );
        },
      ),
    );
  }
}
