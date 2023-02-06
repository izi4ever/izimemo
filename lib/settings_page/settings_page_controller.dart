import 'package:get/get.dart';
import 'package:izimemo/app_storage/app_settings.dart';
import 'package:izimemo/home_page/study_widget/study_widget_controller.dart';

class SettingsPageController extends GetxController {
  AppSettings appSettings = AppSettings();

  // StudyWidgetController studyWidgetController = Get.put(StudyWidgetController());
  StudyWidgetController studyWidgetController = Get.find();

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

    studyWidgetController.sliderWordList.value = studyWidgetController.getSliderWordList;
    studyWidgetController.slideColorIndexList.value = studyWidgetController.getSlideColorIndexList;

    // studyWidgetController.secondsPerEntries.value = studyWidgetController.getSecondsPerEntries;
    studyWidgetController.secondsPerEntries = secondsPerEntries;
    print(secondsPerEntries);
    print(studyWidgetController.secondsPerEntries);

    Get.back();
  }
}
