import 'dart:math';

import 'package:get/get.dart';
import 'package:izimemo/settings_page/settings_page_controller.dart';

import '../../app_storage/app_settings_storage.dart';
import '../../custom/colors/custom_lesson_colors.dart';
import 'test_study_settings.dart';
import 'test_word_list.dart';

class StudyWidgetController extends GetxController {
  AppSettingsStorage appSettingsStorage = AppSettingsStorage();
  // final SettingsPageController settingsPageController = Get.put(SettingsPageController());

  List<String> get getSliderWordList => wordListGenerator(
        testWordList,
        TestStudySettings.firstElement,
        appSettingsStorage.readEntriesInLesson.round(),
        // settingsPageController.entriesInLesson.value.round(),
      );
  late RxList<String> sliderWordList;
  List<int> get getSlideColorIndexList => slideColorListGenerator(sliderWordList.length);
  late RxList<int> slideColorIndexList;
  double get getSecondsPerEntries => appSettingsStorage.readSecondsPerEntries;
  late RxDouble secondsPerEntries;

  StudyWidgetController() {
    sliderWordList = getSliderWordList.obs;
    slideColorIndexList = getSlideColorIndexList.obs;
    secondsPerEntries = getSecondsPerEntries.obs;
  }

  var autoPlay = true.obs;

  List<String> wordListGenerator(List<String> inputList, int firstElement, int elementsInLesson) {
    if ((firstElement + elementsInLesson) > inputList.length) {
      return inputList.sublist(
        firstElement,
        inputList.length,
      );
    } else {
      return inputList.sublist(
        firstElement,
        firstElement + elementsInLesson,
      );
    }
  }

  List<int> slideColorListGenerator(int sliderLength) {
    var random = Random();
    var colorLimit = CustomLessonColors.values.length;
    List<int> outputList = [];
    outputList.add(random.nextInt(colorLimit));
    int i;
    while (outputList.length < sliderLength) {
      do {
        i = random.nextInt(colorLimit);
      } while (i == outputList[(outputList.length - 1)]);
      outputList.add(i);
    }
    return outputList;
  }

  void playPause() => autoPlay.value = !autoPlay.value;
}
