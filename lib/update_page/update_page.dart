import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/widgets/custom_scaffold.dart';
import 'package:izimemo/update_page/update_controller.dart';
import 'package:izimemo/update_page/update_model.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UpdateController updateController = Get.put(UpdateController());
    UpdateModel? updateData = updateController.updateModel;
    String currentLanguage = 'current_language'.tr;
    String? comment;
    String? buttonText;
    String? marketLink;

    if (updateData != null) {
      switch (currentLanguage) {
        case 'en':
          comment = updateData.lang?.en?.comment;
          buttonText = updateData.lang?.en?.buttonText;
          break;
        case 'ru':
          comment = updateData.lang?.ru?.comment;
          buttonText = updateData.lang?.ru?.buttonText;
          break;
        case 'uk':
          comment = updateData.lang?.uk?.comment;
          buttonText = updateData.lang?.uk?.buttonText;
          break;
        case 'de':
          comment = updateData.lang?.de?.comment;
          buttonText = updateData.lang?.de?.buttonText;
          break;
      }

      if (Platform.isAndroid) {
        marketLink = updateData.link?.android;
      } else if (Platform.isIOS) {
        marketLink = updateData.link?.ios;
      }
    }

    // var contentData = updateData.lang.en;
    return CustomScaffold(
      appBarTitle: 'update_page'.tr,
      // child: Center(child: Text('update_page'.tr)),
      child: Column(
        children: [
          Text(comment ?? ''),
          Text(buttonText ?? ''),
          Text(marketLink ?? ''),
        ],
      ),
    );
  }
}
