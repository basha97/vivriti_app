import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vivriti_app/core/widgets/custom_drop_down.dart';
import 'package:vivriti_app/core/widgets/custom_text_field.dart';
import 'package:vivriti_app/features/product/providers/product_provider.dart';
import 'package:vivriti_app/features/product/view/product_list.dart';

class ProductScreen extends HookConsumerWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsProvider = ref.watch(getProductsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [
            CustomTextFormField(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Text('Select Category'),
                  const SizedBox(width: 12),
                  Expanded(child: CustomDropDown()),
                ],
              ),
            ),
            productsProvider.when(
              data: (products) => ProductListWidget(products: products),
              error: (err, _) => Center(
                child: Text('${err.toString()}'),
              ),
              loading: () => Expanded(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
