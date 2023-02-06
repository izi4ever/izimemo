import 'package:flutter/material.dart';
import 'package:izimemo/custom/colors/custom_design_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor = CustomDesignColors.darkBlue,
    this.foregroundColor = Colors.white,
  });
  final VoidCallback onPressed;
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: backgroundColor,
        foregroundColor: Colors.grey[700],
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
