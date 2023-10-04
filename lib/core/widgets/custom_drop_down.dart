import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vivriti_app/features/product/providers/product_provider.dart';

class CustomDropDown extends HookConsumerWidget {
  const CustomDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(getCategoriesProvider);
    final category = ref.watch(categoryProvider);

    return categories.when(
      data: (data) {
        return DropdownButtonFormField2<String>(
          value: category,
          isExpanded: true,
          decoration: InputDecoration(
            suffixIcon: category != null
                ? GestureDetector(
                    onTap: () => ref.invalidate(categoryProvider),
                    child: Icon(Icons.clear),
                  )
                : null,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          hint: Text(
            'Select Category',
            style: TextStyle(fontSize: 14, color: Colors.grey),
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
