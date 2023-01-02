import 'package:flutter/material.dart';

class CustomSettingsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomSettingsButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[500],
      ),
      child: Text(title),
    );
  }
}
