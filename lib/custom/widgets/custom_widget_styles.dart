import 'package:flutter/material.dart';

class CustomWidgetStyles {
  static ButtonStyle whiteButtonBudge = ElevatedButton.styleFrom(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    backgroundColor: Colors.white,
    foregroundColor: Colors.grey[500],
  );
}
