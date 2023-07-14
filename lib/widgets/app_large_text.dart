// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  String text;
  Color color;
  AppLargeText({
    super.key,
    this.size = 30,
    this.color = Colors.white,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
