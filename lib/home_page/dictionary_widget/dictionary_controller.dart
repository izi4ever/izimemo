import 'dart:convert';
import 'dart:math';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../app_storage/app_settings_storage.dart';
import '../../app_storage/dictionary_storage.dart';
import '../../custom/colors/custom_lesson_colors.dart';

class DictionaryController extends GetxController {
  final DictionaryStorage dictionaryStorage = DictionaryStorage();
  final AppSettingsStorage appSettingsStorage = AppSettingsStorage();
  final LineSplitter lineSplitter = const LineSplitter();
  FlutterTts flutterTts = FlutterTts();

  var autoPlay = true.obs;

  late RxInt lastCreatedDicIndex;
  late RxString lastOpenedDic;
  late RxList<Map<String, dynamic>> availableDics;
  late RxInt lengthDicsList;
  late RxInt firstElementCurrentDic;

  Map<String, String> get getDicLanguages => dictionaryStorage.readDicLanguages(dictionaryStorage.readLastOpenedDic);
  late RxMap<String, String> dicLanguages;
  String? getFromLanguageByStorageName(String storageName) {
    var mapLang = dictionaryStorage.readDicLanguages(storageName);
    return mapLang['fromLanguage'];
  }

  String? getToLanguageByStorageName(String storageName) {
    var mapLang = dictionaryStorage.readDicLanguages(storageName);
    return mapLang['toLanguage'];
  }

  List<Map<String, String>> availableLanguages = [
    {
      'key': 'en-US',
      'text': 'English',
    },
    {
      'key': 'de-DE',
      'text': 'Deutsch',
    },
    {
      'key': 'fr-FR',
      'text': 'Français',
    },
    {
      'key': 'uk-UA',
      'text': 'Українська',
    },
    {
      'key': 'pl-PL',
      'text': 'Polski',
    },
    {
      'key': 'cs-CZ',
      'text': 'Čeština',
    },
    {
      'key': 'sl-SK',
      'text': 'Slovenský',
    },
    {
      'key': 'ru-RU',
      'text': 'Русский',
    },
    {
      'key': 'it-IT',
      'text': 'Italiano',
    },
    {
      'key': 'es-ES',
      'text': 'Español',
    },
    {
      'key': 'pt-PT',
      'text': 'Português',
    },
    {
      'key': 'tr-TR',
      'text': 'Türkçe',
    },
    {
      'key': 'ro-RO',
      'text': 'Română',
    },
    {
      'key': 'nl-NL',
      'text': 'Nederlands',
    },
    {
      'key': 'nl',
      'text': 'Dansk',
    },
    {
      'key': 'hu-HU',
      'text': 'Magyar',
    },
    {
      'key': 'lv-LV',
      'text': 'Latviski',
    },
    {
      'key': 'lt-LT',
      'text': 'Lietuvių',
    },
    {
      'key': 'et-EE',
      'text': 'Eestlane',
    },
    {
      'key': 'fi-FI',
      'text': 'Suomen',
    },
    {
      'key': 'nn-NO',
      'text': 'Norsk',
    },
    {
      'key': 'el-GR',
      'text': 'Ελληνικά',
    },
    {
      'key': 'hr-HR',
      'text': 'Hrvatski',
    },
    {
      'key': 'sr-Latn-ME',
      'text': 'Srpski',
    },
    {
      'key': 'ar-SA',
      'text': 'عربي',
    },
    {
      'key': 'zh-CN',
      'text': '中國人',
    },
    {
      'key': 'ja-JP',
      'text': '日本',
    },
    {
      'key': 'ko-KR',
      'text': '한국인',
    },
    {
      'key': 'vi-VN',
      'text': 'Tiếng Việt',
    },
    {
      'key': 'hi-IN',
      'text': 'हिंदी',
    },
  ];

  RxString formFromLanguage = ''.obs;
  RxString formToLanguage = ''.obs;
  bool directionSpeech = true;

  List<String> get getCurrentWordsList => dictionaryStorage.readWordListByDicKey(dictionaryStorage.readLastOpenedDic);
  late RxList<String> currentWordsList;

  List<String> get getSliderWordList => _wordListGenerator(
        dictionaryStorage.readWordListByDicKey(dictionaryStorage.readLastOpenedDic),
        dictionaryStorage.readFirstElementForDictionary(dictionaryStorage.readLastOpenedDic),
        appSettingsStorage.readEntriesInLesson.round(),
      );
  late RxList<String> sliderWordList;

  List<int> get getSlideColorIndexList => _slideColorListGenerator(sliderWordList.length);
  late RxList<int> slideColorIndexList;

  double get getSecondsPerEntries => appSettingsStorage.readSecondsPerEntries;
  late RxDouble secondsPerEntries;

  bool get getIsTextReading => appSettingsStorage.readIsTextReading;
  late RxBool isTextReading;

  double get getReadingSpeed => appSettingsStorage.readReadingSpeed;
  late RxDouble readingSpeed;

  late List<String> _learnedWords;
  late List<String> _learningWords;
  late List<String> _willLearnWords;

  RxInt carouselInitialPage = 0.obs;
  int indexCurrentSlide = 0;

  late RxBool lastEntry;

  RxBool appIsPaused = false.obs;

  DictionaryController() {
    lastCreatedDicIndex = dictionaryStorage.readLastCreatedDicIndex.obs;
    lastOpenedDic = dictionaryStorage.readLastOpenedDic.obs;
    availableDics = dictionaryStorage.readAvailableDics.obs;
    lengthDicsList = availableDics.length.obs;
    firstElementCurrentDic = dictionaryStorage.readFirstElementForDictionary(dictionaryStorage.readLastOpenedDic).obs;
    // dicLanguages = dictionaryStorage.readDicLanguages(dictionaryStorage.readLastOpenedDic).obs;
    dicLanguages = getDicLanguages.obs;

    sliderWordList = getSliderWordList.obs;
    slideColorIndexList = getSlideColorIndexList.obs;
    currentWordsList = getCurrentWordsList.obs;
    secondsPerEntries = getSecondsPerEntries.obs;
    isTextReading = getIsTextReading.obs;
    readingSpeed = getReadingSpeed.obs;

    // speakCurrentSlide;
  }

  //
  // MENU
  //

  void _updateListsForSlider() {
    sliderWordList.value = getSliderWordList;
    slideColorIndexList.value = getSlideColorIndexList;
    currentWordsList.value = getCurrentWordsList;
  }

  void changeCurrentDic(String currentDic) {
    lastOpenedDic.value = currentDic;
    dictionaryStorage.writeLastOpenedDic(currentDic);
    dicLanguages.value = getDicLanguages;

    _updateListsForSlider();

    // indexCurrentSlide = 0;
    carouselInitialPage.value = indexCurrentSlide = 0;
    speakCurrentSlide;
  }

  void editDicNameAndLanguage(int dicIndex, String newDicName) {
    availableDics[dicIndex]['humanName'] = newDicName;
    dictionaryStorage.writeAvailableDics(availableDics);

    String dicKey = availableDics[dicIndex]['storageName'];
    var newDicLanguages = {
      'fromLanguage': formFromLanguage.value,
      'toLanguage': formToLanguage.value,
    };
    dictionaryStorage.writeDicLanguages(dicKey, newDicLanguages);
    if (dicKey == lastOpenedDic.value) {
      dicLanguages.value = newDicLanguages;
    }

    Get.back();
    Get.back();
  }

  void deleteDic(int dicIndex) {
    String dicKey = availableDics[dicIndex]['storageName'];

    // Delete dic, its first element and its languages info;
    dictionaryStorage.deleteWordListByDicKey(dicKey);
    dictionaryStorage.deleteFirstElementForDictionary(dicKey);
    dictionaryStorage.deleteDicLanguages(dicKey);

    // Delete info about dic in description list in storage
    availableDics.removeAt(dicIndex);
    dictionaryStorage.writeAvailableDics(availableDics);

    //If deleted dic is current dic?
    if (dicKey == lastOpenedDic.value) {
      lastOpenedDic.value = availableDics[0]['storageName'];
      dictionaryStorage.writeLastOpenedDic(lastOpenedDic.value);
      firstElementCurrentDic.value = dictionaryStorage.readFirstElementForDictionary(lastOpenedDic.value);
      // dicLanguages.value = dictionaryStorage.readDicLanguages(lastOpenedDic.value);
      dicLanguages.value = getDicLanguages;
    }

    // It will be impossible to delete dic when one's left
    lengthDicsList.value = availableDics.length;

    _updateListsForSlider();

    Get.back();
    Get.back();
  }

  void resetDic(String storageName) {
    dictionaryStorage.writeFirstElementForDictionary(storageName, 0);
    firstElementCurrentDic.value = 0;

    _updateListsForSlider();
    carouselInitialPage.value = 0;

    Get.back();
    Get.back();
  }

  void addDic(String newDicName, String newEntries) {
    lastCreatedDicIndex++;
    dictionaryStorage.writeLastCreatedDicIndex(lastCreatedDicIndex.value);

    String storageDicName = 'dic_${lastCreatedDicIndex.value}';

    Map<String, dynamic> newDicDescription = {
      'storageName': storageDicName,
      'humanName': newDicName,
    };
    availableDics.add(newDicDescription);
    dictionaryStorage.writeAvailableDics(availableDics);

    var newDicLanguages = {
      'fromLanguage': formFromLanguage.value,
      'toLanguage': formToLanguage.value,
    };
    dictionaryStorage.writeDicLanguages(storageDicName, newDicLanguages);
    dicLanguages.value = newDicLanguages;

    lastOpenedDic.value = storageDicName;
    dictionaryStorage.writeLastOpenedDic(lastOpenedDic.value);

    var listFromNewEntries = cleanAndSplitString(newEntries);
    if (listFromNewEntries.isEmpty) {
      listFromNewEntries = ['word_translation'.tr];
    }
    dictionaryStorage.writeWordListByDicKey(lastOpenedDic.value, listFromNewEntries);
    dictionaryStorage.writeFirstElementForDictionary(lastOpenedDic.value, 0);

    _updateListsForSlider();
    speakCurrentSlide;

    Get.back();
    Get.back();
  }

  //
  // STUDY
  //

  void playPause() {
    autoPlay.value = !autoPlay.value;
    carouselInitialPage.value = indexCurrentSlide;
    if (autoPlay.isTrue) speakCurrentSlide;
  }

  List<String> _wordListGenerator(List<String> inputList, int firstElement, int elementsInLesson) {
    if ((firstElement + elementsInLesson) > inputList.length) {
      return inputList.sublist(firstElement);
    } else {
      return inputList.sublist(
        firstElement,
        firstElement + elementsInLesson,
      );
    }
  }

  List<int> _slideColorListGenerator(int sliderLength) {
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

  void _splitWordsList() {
    if (currentWordsList.isNotEmpty) {
      // _learnedWords list
      if (firstElementCurrentDic.value == 0) {
        _learnedWords = [];
      } else {
        // _learnedWords = currentWordsList.sublist(0, (firstElementCurrentDic.value - 1));
        _learnedWords = currentWordsList.sublist(0, (firstElementCurrentDic.value));
      }

      // _willLearnWords list
      int entriesInLesson = appSettingsStorage.readEntriesInLesson.round();
      if ((firstElementCurrentDic.value + entriesInLesson) >= currentWordsList.length) {
        _willLearnWords = [];
      } else {
        _willLearnWords = currentWordsList.sublist((firstElementCurrentDic.value + entriesInLesson));
      }

      // _learningWords list
      _learningWords = sliderWordList;
    } else {
      _learnedWords = [];
      _learningWords = [];
      _willLearnWords = [];
    }
  }

  void _joinSaveUpdateDic() {
    firstElementCurrentDic.value = _learnedWords.length;
    dictionaryStorage.writeFirstElementForDictionary(lastOpenedDic.value, firstElementCurrentDic.value);
    List<String> tmpList = [
      ..._learnedWords,
      ..._learningWords,
      ..._willLearnWords,
    ];
    dictionaryStorage.writeWordListByDicKey(lastOpenedDic.value, tmpList);

    _updateListsForSlider();
  }

  void learnedEntry(int index) {
    _splitWordsList();
    _learnedWords.add(_learningWords[index]);
    _learningWords.removeAt(index);
    if (_willLearnWords.isNotEmpty) {
      // _learningWords.insert(0, _willLearnWords[0]);
      _learningWords.add(_willLearnWords[0]);
      _willLearnWords.removeAt(0);
      carouselInitialPage.value = _learningWords.length - 1;
      indexCurrentSlide = _learningWords.length - 1;
    } else {
      if (indexCurrentSlide >= _learningWords.length) {
        carouselInitialPage.value = 0;
        indexCurrentSlide = 0;
      }
    }
    speakCurrentSlide;
    _joinSaveUpdateDic();
  }

  void moveEntry(int index) {
    _splitWordsList();
    // _willLearnWords.add(_learningWords[index]);
    var pos = 20;
    if (_willLearnWords.length <= pos) pos = _willLearnWords.length - 1;
    _willLearnWords.insert(pos, _learningWords[index]);
    _learningWords.removeAt(index);
    _learningWords.insert(0, _willLearnWords[0]);
    _willLearnWords.removeAt(0);
    _joinSaveUpdateDic();
    carouselInitialPage.value = 0;
    indexCurrentSlide = 0;
    speakCurrentSlide;
  }

  void deleteEntry(int index) {
    _splitWordsList();
    _learningWords.removeAt(index);
    if (_willLearnWords.isNotEmpty) {
      _learningWords.insert(0, _willLearnWords[0]);
      _willLearnWords.removeAt(0);
    }
    _joinSaveUpdateDic();
    carouselInitialPage.value = 0;
    indexCurrentSlide = 0;
    speakCurrentSlide;
  }

  void editEntry(int index, String replaceString) {
    _splitWordsList();
    _learningWords[index] = replaceString;
    _joinSaveUpdateDic();
    carouselInitialPage.value = index;
    speakCurrentSlide;
  }

  void addEntries(String rawString) {
    var tmpList = cleanAndSplitString(rawString);
    _splitWordsList();
    _learningWords = [
      ...tmpList,
      ..._learningWords,
    ];
    _joinSaveUpdateDic();
    carouselInitialPage.value = 0;
    indexCurrentSlide = 0;
    speakCurrentSlide;
  }

  void addEntriesToEnd(String rawString) {
    var tmpList = cleanAndSplitString(rawString);
    _splitWordsList();
    _willLearnWords.addAll(tmpList);
    _joinSaveUpdateDic();
    carouselInitialPage.value = indexCurrentSlide;
  }

  List<String> cleanAndSplitString(String multiRowString) {
    var tmpList = lineSplitter.convert(multiRowString);
    tmpList.removeWhere((element) => element.length < 5);
    return tmpList;
  }

  //
  // SOUND
  //

  Future<void> _speak(
    String text,
    String language,
  ) async {
    await flutterTts.setSharedInstance(true);
    flutterTts.awaitSpeakCompletion(true);
    await flutterTts.setLanguage(language);
    await flutterTts.setPitch(1); // Tone
    await flutterTts.setSpeechRate(readingSpeed.value); // Speed
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(text);
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<void> slideSpeak(int index) async {
    if (isTextReading.value) {
      await flutterTts.stop();
      String rawText = sliderWordList[index];
      String textWithoutTranscription = rawText.replaceAll(RegExp('\\[.*?\\]'), '').replaceAll(RegExp('\\(.*?\\)'), '');
      var stringParts = textWithoutTranscription.split(' - ');
      var fromLanguageLocale = getFromLanguageByStorageName(lastOpenedDic.value)!;
      var toLanguageLocale = getToLanguageByStorageName(lastOpenedDic.value)!;
      if (stringParts.length > 1) {
        if (directionSpeech) {
          await _speak(stringParts[0], fromLanguageLocale);
          await _speak(stringParts[1], toLanguageLocale);
        } else {
          await _speak(stringParts[1], toLanguageLocale);
          await _speak(stringParts[0], fromLanguageLocale);
        }
      } else {
        await _speak(textWithoutTranscription, toLanguageLocale);
      }

      if (index >= (sliderWordList.length - 1)) {
        directionSpeech = !directionSpeech;
      }
    }
  }

  Future<void> get speakCurrentSlide async => await slideSpeak(indexCurrentSlide);

  Future<void> backgroundSpeech() async {
    if (isTextReading.value) {
      Future.delayed(Duration(seconds: secondsPerEntries.value.round()), () async {
        ++indexCurrentSlide;
        if (indexCurrentSlide >= slideColorIndexList.length) {
          indexCurrentSlide = 0;
        }
        carouselInitialPage.value = indexCurrentSlide;
        await slideSpeak(indexCurrentSlide);
      });
    }
  }

  Future<void> backgroundSpeechOnce() async {
    if (isTextReading.value) {
      ++indexCurrentSlide;
      if (indexCurrentSlide >= slideColorIndexList.length) {
        indexCurrentSlide = 0;
      }
      carouselInitialPage.value = indexCurrentSlide;
      await slideSpeak(indexCurrentSlide);
    }
  }
}
