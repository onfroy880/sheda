import 'package:flutter/material.dart';
import 'package:sheda/mics/color.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  ResponsiveButton(
      {super.key, this.widht, this.btnTxt, this.isResponsive = false});

  bool? isResponsive;
  double? widht;
  String? btnTxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widht,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.marron_200,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            btnTxt!,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
