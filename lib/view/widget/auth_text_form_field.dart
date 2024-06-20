import 'package:flutter/material.dart';

class AuthTextFromField extends StatelessWidget {
  const AuthTextFromField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
