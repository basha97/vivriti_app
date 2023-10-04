import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vivriti_app/features/product/providers/product_provider.dart';

class CustomTextFormField extends HookConsumerWidget {
  const CustomTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProviderValue = ref.watch(searchProvider);
    final textEditingController = useTextEditingController();

    return TextFormField(
      controller: textEditingController,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      key: key,
      onChanged: (value) => EasyDebounce.debounce(
        'PRODUCT-SEARCH',
        Duration(milliseconds: 500),
        () => ref.read(searchProvider.notifier).state = value,
      ),
      decoration: InputDecoration(
        fillColor: Colors.red,
        enabledBorder: outLineInputBorder,
        border: outLineInputBorder,
        focusedBorder: outLineInputBorder,
        hintText: 'Search Products',
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: searchProviderValue != null
            ? GestureDetector(
                onTap: () => {
                  textEditingController.clear(),
                  ref.invalidate(searchProvider)
                },
                child: Icon(Icons.close, color: Colors.black),
              )
            : Icon(Icons.search, color: Colors.black),
      ),
    );
  }
}

final outLineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide(color: Colors.grey, width: 0.5),
);
