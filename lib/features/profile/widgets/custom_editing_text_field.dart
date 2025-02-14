import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomEditingTextField extends StatelessWidget {
  CustomEditingTextField(
      {super.key, required this.onChanged, required this.id});

  final Function(String)? onChanged;
  bool obscureText = false;
  final String id;

  @override
  Widget build(BuildContext context) {
    if (id == 'password') {
      obscureText = true;
    }

    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}
