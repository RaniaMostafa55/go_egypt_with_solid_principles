import 'package:flutter/material.dart';

class ImageOption extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final String title;
  const ImageOption(
      {required this.icon,
      required this.onPressed,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              radius: 30,
              child: Icon(icon),
            )),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
