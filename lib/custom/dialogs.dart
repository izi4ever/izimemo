import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/custom_constants.dart';
import 'package:izimemo/home_page/snippet_save_share_links/snippet_save_share_links_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'colors/custom_design_colors.dart';
import 'widgets/custom_elevated_button.dart';
import 'widgets/custom_form_label.dart';
import 'widgets/custom_text_form_field.dart';

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

  void addBookmarkDialog(WebViewController webController) async {
    final SnippetSaveShareLinksController snippetSaveShareLinksController = Get.find();
    
    final formKey = GlobalKey<FormState>();

    final titleFieldController = TextEditingController();
    final linkFieldController = TextEditingController();

    var currentUrl = await webController.currentUrl();
    linkFieldController.text = currentUrl!;

    var pageTitle = await webController.getTitle();
    titleFieldController.text = pageTitle!;

    showDialog(
      content: Form(
        key: formKey,
        child: SizedBox(
          height: 240,
          child: ListView(
            children: [
              CustomFormLabel(
                title: 'title'.tr,
                topPadding: 4,
              ),
              CustomTextFormField(
                controller: titleFieldController,
                validator: (val) {
                  if (titleFieldController.text.length > CustomConstants.urlTitleMaxLength) {
                    return 'too_long_title'.tr;
                  } else if (titleFieldController.text.isEmpty) {
                    return 'empty_field'.tr;
                  } else {
                    return null;
                  }
                },
                maxLength: CustomConstants.urlTitleMaxLength,
                maxLengthEnforcement: MaxLengthEnforcement.none,
              ),
              CustomFormLabel(title: 'link'.tr, topPadding: 20),
              CustomTextFormField(
                controller: linkFieldController,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
      actions: [
        CustomElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              snippetSaveShareLinksController.addBookmark(titleFieldController.text, linkFieldController.text);
            }
          },
          title: 'save'.tr,
        ),
        CustomElevatedButton(
          onPressed: () => Get.back(),
          title: 'cancel'.tr,
          backgroundColor: CustomDesignColors.mediumBlue,
          foregroundColor: CustomDesignColors.darkBlue,
        ),
      ],
    );
  }
}
