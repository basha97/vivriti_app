import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vivriti_app/core/widgets.dart';
import 'package:vivriti_app/features/product/providers/product_provider.dart';
import 'package:vivriti_app/features/product/view/product_list.dart';

class ProductScreen extends HookConsumerWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsProvider = ref.watch(getProductsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
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
                  Expanded(child: Test()),
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

class Test extends HookConsumerWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.read(getCategoriesProvider);

    return categories.when(
      data: (data) {
        return DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          hint: Text(
            'Select Category ${data.length}',
            style: TextStyle(fontSize: 14),
          ),
          items: data
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (value) {
            print('onChanged => $value');
            ref.read(categoryProvider.notifier).state = value;
          },
          onSaved: (value) {},
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        );
      },
      error: (_, __) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
