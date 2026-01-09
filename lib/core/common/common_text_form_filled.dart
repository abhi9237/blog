import 'package:flutter/material.dart';

class CommonTextFormFilled extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? isObscureText;
  const CommonTextFormFilled({super.key, required this.hintText, required this.controller, this.isObscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText ?? false,
        controller:controller,
      decoration: InputDecoration(hintText: hintText),
      validator: (v) {
        if (v!.isEmpty) {
          return '$hintText is missing';
        }
        return null;
      },
    );
  }
}
