import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:izimemo/custom/custom_constants.dart';

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

  void showDialog({
    double? widthRatio,
    required Widget content,
    EdgeInsetsGeometry? contentPadding,
    required List<Widget> actions,
    MainAxisAlignment? actionsAlignment,
    EdgeInsetsGeometry? actionsPadding,
  }) {
    Get.dialog(
      AlertDialog(
        content: Container(
          width: (widthRatio != null)
              ? MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width * widthRatio
              : MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width * 0.7,
          padding: (contentPadding != null) ? contentPadding : const EdgeInsets.only(top: 4),
          child: content,
        ),
        actions: actions,
        actionsAlignment: (actionsAlignment != null) ? actionsAlignment : MainAxisAlignment.start,
        actionsPadding: (actionsPadding != null)
            ? actionsPadding
            : const EdgeInsets.only(
                bottom: 24,
                left: 24,
                right: 24,
              ),
        insetPadding: EdgeInsets.zero,
        elevation: 0,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(CustomConstants.dialogRadius),
          ),
        ),
      ),
      barrierColor: CustomDesignColors.dialogBarrierColor,
    );
  }
}
