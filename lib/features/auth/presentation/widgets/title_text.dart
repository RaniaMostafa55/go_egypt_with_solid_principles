import 'package:flutter/material.dart';

//a  class contains the styling of titles used in the app
class TitleText extends StatelessWidget {
  //the variables required in this class and must send values to them using constructor
  final String text;
  final double fontSize;
  const TitleText(this.text, this.fontSize, {super.key});

  @override
  Widget build(BuildContext context) {
    //add "Text" widget with certain font size and weight
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
