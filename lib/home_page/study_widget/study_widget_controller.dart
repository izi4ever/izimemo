import 'dart:math';

import 'package:get/get.dart';

import '../../custom/colors/custom_lesson_colors.dart';

class StudyWidgetController extends GetxController {
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

  void playPause() {
    autoPlay.value = !autoPlay.value;
  }
}
