import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vivriti_app/features/product/providers/product_provider.dart';

class ProductScreen extends HookConsumerWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsProvider = ref.watch(getProductsProvider);
    return Scaffold(
      body: productsProvider.when(
        data: (products) {
          return Center(child: Text('${products.length}'));
        },
        error: (err, _) => Center(
          child: Text('${err.toString()}'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
