import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText(
      {super.key,
      required this.text,
      this.fontSize = 12.0,
      this.textHeight = 1.0});

  final String text;
  final double fontSize, textHeight;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Times',
            fontWeight: FontWeight.bold,
            height: textHeight),
      ),
    );
  }
}
