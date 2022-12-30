import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'colors/custom_design_colors.dart';

class Dialogs {
  void showSnackBar(String title) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      messageText: const Text(
        '',
        style: TextStyle(fontSize: 0),
      ),
      duration: const Duration(seconds: 5),
      barBlur: 0,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 12),
      borderRadius: 12,
      backgroundColor: CustomDesignColors.mediumBlue,
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(
        Icons.hdr_strong,
        color: CustomDesignColors.darkBlue,
      ),
      onTap: (snack) => Get.closeCurrentSnackbar(),
    );
  }
}