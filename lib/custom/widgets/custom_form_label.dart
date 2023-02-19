import 'package:flutter/material.dart';
import 'package:izimemo/custom/colors/custom_design_colors.dart';

class CustomFormLabel extends StatelessWidget {
  const CustomFormLabel({
    super.key,
    required this.title,
    this.topPadding = 20,
  });

  final String title;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 12, top: topPadding),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: CustomDesignColors.darkBlue,
        ),
      ),
    );
  }
}
