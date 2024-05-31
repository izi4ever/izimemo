import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/widgets/custom_elevated_button_icon.dart';
import 'package:izimemo/custom/widgets/custom_scaffold.dart';
import 'package:izimemo/update_page/update_controller.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UpdateController updateController = Get.put(UpdateController());

    return PopScope(
      onPopInvoked: (onPop) => {},
      child: CustomScaffold(
        appBarTitle: 'update_page'.tr,
        showBackButtonInAppBar: false,
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset('assets/icons/software.png', height: 220.0),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Text(
                updateController.comment,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
            ),
            // CustomElevatedButton(
            //   onPressed: () => updateController.launchStoreLink(),
            //   title: updateController.buttonText,
            // ),
            CustomElevatedButtonIcon(
              onPressed: () => updateController.launchStoreLink(),
              title: updateController.buttonText,
              icon: Icons.cloud_download_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
