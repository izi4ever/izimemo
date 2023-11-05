import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:izimemo/app_storage/base_dictionaries/base_dictionary_de_ru.dart';
import 'package:izimemo/app_storage/base_dictionaries/base_dictionary_en_ru.dart';
import 'package:izimemo/app_storage/base_dictionaries/base_dictionary_fr_ru.dart';

class DictionaryStorage {
  final box = GetStorage();
  final LineSplitter lineSplitter = const LineSplitter();

  int get readLastCreatedDicIndex => box.read('lastCreatedDicIndex') ?? 3;
  void writeLastCreatedDicIndex(int value) => box.write('lastCreatedDicIndex', value);

  String get readLastOpenedDic => box.read('lastOpenedDic') ?? 'dic_1';
  void writeLastOpenedDic(String value) => box.write('lastOpenedDic', value);

  List<Map<String, dynamic>> get readAvailableDicsDataList => List<Map<String, dynamic>>.from(box.read('availableDics') ??
      [
        {
          'storageName': 'dic_1',
          'humanName': 'En-Ru TOP',
          'fromLanguage': 'en-US',
          'toLanguage': 'ru-RU',
          'readingIndex': '0',
        },
        {
          'storageName': 'dic_2',
          'humanName': 'De-Ru TOP',
          'fromLanguage': 'de-DE',
          'toLanguage': 'ru-RU',
          'readingIndex': '0',
        },
        {
          'storageName': 'dic_3',
          'humanName': 'Fr-Ru TOP',
          'fromLanguage': 'fr-FR',
          'toLanguage': 'ru-RU',
          'readingIndex': '0',
        },
      ]);
  void writeAvailableDicsDataList(List<Map<String, dynamic>> value) => box.write('availableDics', value);

  int readFirstElementForDictionary(String dicKey) => box.read('${dicKey}_firstElement') ?? 0;
  void writeFirstElementForDictionary(String dicKey, int value) => box.write('${dicKey}_firstElement', value);
  void deleteFirstElementForDictionary(String dicKey) => box.remove('${dicKey}_firstElement');

  Map<String, String> readDicLanguages(String dicKey) =>
      Map<String, String>.from(box.read('${dicKey}_languages') ?? fillInDicLanguages(dicKey));

  void writeDicLanguages(String dicKey, Map<String, String> value) => box.write('${dicKey}_languages', value);
  void deleteDicLanguages(String dicKey) => box.remove('${dicKey}_languages');

  Map<String, String> fillInDicLanguages(String key) {
    if (key == 'dic_1') {
      return {
        'fromLanguage': 'en-US',
        'toLanguage': 'ru-RU',
      };
    } else if (key == 'dic_2') {
      return {
        'fromLanguage': 'de-DE',
        'toLanguage': 'ru-RU',
      };
    } else if (key == 'dic_3') {
      return {
        'fromLanguage': 'fr-FR',
        'toLanguage': 'ru-RU',
      };
    } else {
      return {
        'fromLanguage': 'en-US',
        'toLanguage': 'en-US',
      };
    }
  }

  List<String> readWordListByDicKey(String dicKey) => List<String>.from(box.read(dicKey) ?? fillInDic(dicKey));
  void writeWordListByDicKey(String dicKey, List<String> value) => box.write(dicKey, value);
  void deleteWordListByDicKey(String dicKey) => box.remove(dicKey);

  List<String> fillInDic(String key) {
    if (key == 'dic_1') {
      return lineSplitter.convert(BaseDictionaryEnRu.dic);
    } else if (key == 'dic_2') {
      return lineSplitter.convert(BaseDictionaryDeRu.dic);
    } else if (key == 'dic_3') {
      return lineSplitter.convert(BaseDictionaryFrRu.dic);
    } else {
      return [];
    }
  }
}
