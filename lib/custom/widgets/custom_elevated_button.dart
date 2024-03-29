import 'package:flutter/material.dart';
import 'package:izimemo/custom/colors/custom_design_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.verticalPadding = 14,
    this.horizontalPadding = 24,
    this.backgroundColor = CustomDesignColors.darkBlue,
    this.foregroundColor = Colors.white,
  });
  final VoidCallback onPressed;
  final String title;
  final double verticalPadding;
  final double horizontalPadding;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: foregroundColor,
        ),
      ),
    );
  }
}
