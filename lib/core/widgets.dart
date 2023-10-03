import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      key: key,
      decoration: InputDecoration(
        fillColor: Colors.red,
        enabledBorder: outLineInputBorder,
        border: outLineInputBorder,
        focusedBorder: outLineInputBorder,
        suffixIcon: Icon(Icons.search, color: Colors.black),
      ),
    );
  }
}

final outLineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide(color: Colors.grey, width: 0.5),
);
