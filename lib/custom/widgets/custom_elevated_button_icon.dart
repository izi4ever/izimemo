import 'package:flutter/material.dart';
import 'package:izimemo/custom/colors/custom_design_colors.dart';

class CustomElevatedButtonIcon extends StatelessWidget {
  const CustomElevatedButtonIcon({
    super.key,
    required this.onPressed,
    required this.title,
    required this.icon,
    this.verticalPadding = 14,
    this.horizontalPadding = 24,
    this.backgroundColor = CustomDesignColors.darkBlue,
    this.foregroundColor = Colors.white,
  });
  final VoidCallback onPressed;
  final String title;
  final IconData icon;
  final double verticalPadding;
  final double horizontalPadding;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      icon: Icon(icon),
      label: Text(
        title,
        style: TextStyle(
          color: foregroundColor,
        ),
      ),
    );
  }
}
