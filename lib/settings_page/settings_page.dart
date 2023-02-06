import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/colors/custom_design_colors.dart';
import 'package:izimemo/custom/widgets/custom_scaffold.dart';
import 'package:izimemo/settings_page/settings_page_controller.dart';

import '../custom/widgets/custom_elevated_button.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final SettingsPageController settingsPageController = Get.put(SettingsPageController());

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'settings_page_title'.tr,
      child: Obx(
        () => ListView(
          children: [
            const SizedBox(height: 56),
            Text.rich(
              TextSpan(children: [
                // const TextSpan(
                //   text: 'Number of entries per lesson — ',
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                // ),
                WidgetSpan(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      'entries_in_lesson'.tr,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                WidgetSpan(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: CustomDesignColors.darkBlue,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    child: Text(
                      settingsPageController.entriesInLesson.value.round().toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ]),
            ),
            Slider(
              value: settingsPageController.entriesInLesson.value,
              onChanged: (double value) => settingsPageController.onChangedEntriesInLesson(value),
              min: 2,
              max: 20,
              divisions: 18,
              label: settingsPageController.entriesInLesson.value.round().toString(),
            ),

            // Seconds per entry
            const SizedBox(height: 40),
            Text.rich(
              TextSpan(children: [
                WidgetSpan(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      'seconds_per_entry'.tr,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                WidgetSpan(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: CustomDesignColors.darkBlue,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    child: Text(
                      settingsPageController.secondsPerEntries.value.round().toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ]),
            ),
            Slider(
              value: settingsPageController.secondsPerEntries.value,
              onChanged: (double value) => settingsPageController.onChangedSecondsPerEntries(value),
              min: 3,
              max: 30,
              divisions: 27,
              label: settingsPageController.secondsPerEntries.value.round().toString(),
            ),

            // Buttons for saving or canceling
            const SizedBox(height: 40),
            Row(
              children: [
                CustomElevatedButton(
                  onPressed: settingsPageController.onSaveSettings,
                  title: 'save'.tr,
                ),
                const SizedBox(width: 12),
                CustomElevatedButton(
                  onPressed: settingsPageController.onCancelSettings,
                  title: 'cancel'.tr,
                  backgroundColor: CustomDesignColors.lightBlue,
                  foregroundColor: CustomDesignColors.darkBlue,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
