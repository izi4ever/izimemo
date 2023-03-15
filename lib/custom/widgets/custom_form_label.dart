import 'package:flutter/material.dart';
import 'package:izimemo/custom/colors/custom_design_colors.dart';

class CustomFormLabel extends StatelessWidget {
  const CustomFormLabel({
    super.key,
    required this.title,
    this.topPadding = 20,
    this.horizontalPadding = 20,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.color = CustomDesignColors.darkBlue,
  });

  final String title;
  final double topPadding;
  final double horizontalPadding;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding, bottom: 12, top: topPadding),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
