import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  final String text;
  final String buttonText;
  final void Function()? onTap;
  const AuthTextButton(
      {required this.text,
      required this.buttonText,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        InkWell(
            onTap: onTap,
            child: Text(
              buttonText,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500),
            ))
      ],
    );
  }
}
