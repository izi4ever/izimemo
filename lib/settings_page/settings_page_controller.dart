import 'package:get/get.dart';
import 'package:izimemo/app_storage/app_settings_storage.dart';

import '../home_page/dictionary_widget/dictionary_controller.dart';

class SettingsPageController extends GetxController {
  AppSettingsStorage appSettings = AppSettingsStorage();

  final DictionaryController dictionaryController = Get.put(DictionaryController());
  
  late RxDouble entriesInLesson;
  late RxDouble secondsPerEntries;

  SettingsPageController() {
    entriesInLesson = appSettings.readEntriesInLesson.obs;
    secondsPerEntries = appSettings.readSecondsPerEntries.obs;
  }

  void onChangedEntriesInLesson(double value) => entriesInLesson.value = value;

  void onChangedSecondsPerEntries(double value) => secondsPerEntries.value = value;

  void onCancelSettings() {
    entriesInLesson.value = appSettings.readEntriesInLesson;
    secondsPerEntries.value = appSettings.readSecondsPerEntries;
    Get.back();
  }

  void onSaveSettings() {
    appSettings.writeEntriesInLesson(entriesInLesson.value);
    appSettings.writeSecondsPerEntries(secondsPerEntries.value);

    dictionaryController.sliderWordList.value = dictionaryController.getSliderWordList;
    dictionaryController.slideColorIndexList.value = dictionaryController.getSlideColorIndexList;

    dictionaryController.secondsPerEntries = secondsPerEntries;

    Get.back();
  }
}
