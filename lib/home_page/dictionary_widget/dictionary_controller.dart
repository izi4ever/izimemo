import 'dart:math';

import 'package:get/get.dart';

import '../../app_storage/app_settings_storage.dart';
import '../../app_storage/dictionary_storage.dart';
import '../../custom/colors/custom_lesson_colors.dart';

class DictionaryController extends GetxController {
  final DictionaryStorage dictionaryStorage = DictionaryStorage();
  final AppSettingsStorage appSettingsStorage = AppSettingsStorage();

  late RxInt lastCreatedDicIndex;
  late RxString lastOpenedDic;
  late RxList<Map<String, dynamic>> availableDics;
  late RxInt lengthDicsList;
  late RxInt firstElementCurrentDic;

  var autoPlay = true.obs;

  List<String> get getSliderWordList => wordListGenerator(
        // dictionaryStorage.readWordListByDicKey(lastOpenedDic.value),
        // dictionaryStorage.readFirstElementForDictionary(lastOpenedDic.value),
        dictionaryStorage.readWordListByDicKey(dictionaryStorage.readLastOpenedDic),
        dictionaryStorage.readFirstElementForDictionary(dictionaryStorage.readLastOpenedDic),
        appSettingsStorage.readEntriesInLesson.round(),
      );
  late RxList<String> sliderWordList;
  List<int> get getSlideColorIndexList => slideColorListGenerator(sliderWordList.length);
  late RxList<int> slideColorIndexList;
  double get getSecondsPerEntries => appSettingsStorage.readSecondsPerEntries;
  late RxDouble secondsPerEntries;

  DictionaryController() {
    lastCreatedDicIndex = dictionaryStorage.readLastCreatedDicIndex.obs;
    lastOpenedDic = dictionaryStorage.readLastOpenedDic.obs;
    availableDics = dictionaryStorage.readAvailableDics.obs;
    lengthDicsList = availableDics.length.obs;
    // firstElementCurrentDic = dictionaryStorage.readFirstElementForDictionary(lastOpenedDic.value).obs;
    firstElementCurrentDic = dictionaryStorage.readFirstElementForDictionary(dictionaryStorage.readLastOpenedDic).obs;

    sliderWordList = getSliderWordList.obs;
    slideColorIndexList = getSlideColorIndexList.obs;
    secondsPerEntries = getSecondsPerEntries.obs;
  }

  //
  // MENU
  //

  void changeCurrentDic(String currentDic) {
    lastOpenedDic.value = currentDic;
    dictionaryStorage.writeLastOpenedDic(currentDic);
  }

  void renameDic(int dicIndex, String newDicName) {
    availableDics[dicIndex]['humanName'] = newDicName;
    dictionaryStorage.writeAvailableDics(availableDics);
    Get.back();
    Get.back();
  }

  void deleteDic(int dicIndex) {
    String dicKey = availableDics[dicIndex]['storageName'];

    // Delete dic and their index
    dictionaryStorage.deleteWordListByDicKey(dicKey);
    dictionaryStorage.deleteFirstElementForDictionary(dicKey);

    // Delete info about dic in description list in storage
    availableDics.removeAt(dicIndex);
    dictionaryStorage.writeAvailableDics(availableDics);

    //If deleted dic is current dic?
    if (dicKey == lastOpenedDic.value) {
      lastOpenedDic.value = availableDics[0]['storageName'];
      firstElementCurrentDic.value = dictionaryStorage.readFirstElementForDictionary(lastOpenedDic.value);
    }

    // It will be impossible to delete dic when one left
    lengthDicsList.value = availableDics.length;

    Get.back();
    Get.back();
  }

  void resetDic(String storageName) {
    dictionaryStorage.writeFirstElementForDictionary(storageName, 0);
    firstElementCurrentDic.value = 0;

    Get.back();
    Get.back();
  }

  void addDic(String newDicName) {
    lastCreatedDicIndex++;
    dictionaryStorage.writeLastCreatedDicIndex(lastCreatedDicIndex.value);

    String storageDicName = 'dic_${lastCreatedDicIndex.value}';
    Map<String, dynamic> newDicDescription = {
      'storageName': storageDicName,
      'humanName': newDicName,
    };

    availableDics.add(newDicDescription);
    dictionaryStorage.writeAvailableDics(availableDics);

    lastOpenedDic.value = storageDicName;
    dictionaryStorage.writeLastOpenedDic(lastOpenedDic.value);

    Get.back();
    Get.back();
  }

  //
  // STUDY
  //

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
