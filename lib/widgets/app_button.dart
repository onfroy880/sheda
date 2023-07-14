import 'package:flutter/material.dart';
import 'package:sheda/widgets/app_text.dart';
import 'package:sheda/mics/color.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  AppButton(
      {super.key,
      required this.size,
      this.icon,
      this.text,
      this.isIcon = false,
      required this.color,
      required this.backgroundColor,
      required this.borderColor});

  IconData? icon;
  String? text;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  double size;
  bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15)),
      child: isIcon == false
          ? Center(child: AppText(text: text!, color: AppColors.black_200))
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
