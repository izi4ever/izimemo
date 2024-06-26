import 'package:get/get.dart';
import 'package:izimemo/app_storage/app_settings_storage.dart';
import 'package:izimemo/home_page/home_page_controller.dart';

import '../home_page/dictionary_widget/dictionary_controller.dart';

class SettingsPageController extends GetxController {
  AppSettingsStorage appSettings = AppSettingsStorage();

  final DictionaryController dictionaryController = Get.put(DictionaryController());
  final HomePageController homePageController = Get.put(HomePageController());

  late RxDouble entriesInLesson;
  late RxDouble secondsPerEntries;
  late RxBool isTextReading;
  late RxInt readingTimes;
  late RxDouble readingSpeed;
  late RxDouble backgroundVolume;

  SettingsPageController() {
    entriesInLesson = appSettings.readEntriesInLesson.obs;
    secondsPerEntries = appSettings.readSecondsPerEntries.obs;
    isTextReading = appSettings.readIsTextReading.obs;
    readingTimes = appSettings.readReadingTimes.obs;
    readingSpeed = appSettings.readReadingSpeed.obs;
    backgroundVolume = appSettings.readBackgroundVolume.obs;
  }

  void onChangedEntriesInLesson(double value) => entriesInLesson.value = value;

  void onChangedSecondsPerEntries(double value) => secondsPerEntries.value = value;

  void onChangedIsTextReading(bool value) => isTextReading.value = value; 

  void onChangedReadingTimes(int value) => readingTimes.value = value;

  void onChangedReadingSpeed(double value) => readingSpeed.value = value;

  void onChangedBackgroundVolume(double value) => backgroundVolume.value = value;

  void onCancelSettings() {
    entriesInLesson.value = appSettings.readEntriesInLesson;
    // secondsPerEntries.value = appSettings.readSecondsPerEntries;
    secondsPerEntries.value = dictionaryController.getSecondsPerEntries;
    isTextReading.value = appSettings.readIsTextReading;
    readingTimes.value = appSettings.readReadingTimes;
    readingSpeed.value = appSettings.readReadingSpeed;
    backgroundVolume.value = appSettings.readBackgroundVolume;

    Get.back();
  }

  void onSaveSettings() {
    appSettings.writeEntriesInLesson(entriesInLesson.value);
    appSettings.writeSecondsPerEntries(secondsPerEntries.value);
    appSettings.writeIsReading(isTextReading.value);
    appSettings.writeReadingTimes(readingTimes.value);
    appSettings.writeReadingSpeed(readingSpeed.value);
    appSettings.writeBackgroundVolume(backgroundVolume.value);

    dictionaryController.sliderWordList.value = dictionaryController.getSliderWordList;
    dictionaryController.slideColorIndexList.value = dictionaryController.getSlideColorIndexList;

    // dictionaryController.secondsPerEntries = secondsPerEntries;
    dictionaryController.secondsPerEntries.value = dictionaryController.getSecondsPerEntries;
    dictionaryController.isTextReading = isTextReading;
    dictionaryController.readingTimes = readingTimes;
    dictionaryController.readingSpeed = readingSpeed;
    homePageController.backgroundVolume = backgroundVolume;

    Get.back();
  }
}
