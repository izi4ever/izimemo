import 'package:get/get.dart';
import 'package:izimemo/app_storage/dics_data_storage.dart';
import 'package:izimemo/app_storage/dics_description_storage.dart';

class DictionaryMenuWidgetController extends GetxController {
  final DicsDescriptionStorage dicsDescriptionStorage = DicsDescriptionStorage();
  final DicsDataStorage dicsDataStorage = DicsDataStorage();

  late RxInt lastCreatedDicIndex;
  late RxString lastOpenedDic;
  late RxList<Map<String, dynamic>> availableDics;
  late RxInt lengthDicsList;
  late RxInt firstElementCurrentDic;

  DictionaryMenuWidgetController() {
    lastCreatedDicIndex = dicsDescriptionStorage.readLastCreatedDicIndex.obs;
    lastOpenedDic = dicsDescriptionStorage.readLastOpenedDic.obs;
    availableDics = dicsDescriptionStorage.readAvailableDics.obs;
    lengthDicsList = availableDics.length.obs;
    firstElementCurrentDic = dicsDataStorage.readFirstElementForDictionary(lastOpenedDic.value).obs;
  }

  void changeCurrentDic(String currentDic) {
    lastOpenedDic.value = currentDic;
    dicsDescriptionStorage.writeLastOpenedDic(currentDic);

    print('changeCurrentDic: ${dicsDescriptionStorage.readLastOpenedDic}');
  }

  void renameDic(int dicIndex, String newDicName) {
    availableDics[dicIndex]['humanName'] = newDicName;
    dicsDescriptionStorage.writeAvailableDics(availableDics);
    Get.back();
    Get.back();
  }

  void deleteDic(int dicIndex) {
    String dicKey = availableDics[dicIndex]['storageName'];

    // Delete dic and their index
    dicsDataStorage.deleteWordListByDicKey(dicKey);
    dicsDataStorage.deleteFirstElementForDictionary(dicKey);

    // Delete info about dic in description list in storage
    availableDics.removeAt(dicIndex);
    dicsDescriptionStorage.writeAvailableDics(availableDics);

    //If deleted dic is current dic?
    if (dicKey == lastOpenedDic.value) {
      lastOpenedDic.value = availableDics[0]['storageName'];
      firstElementCurrentDic.value = dicsDataStorage.readFirstElementForDictionary(lastOpenedDic.value);
    }

    // It will be impossible to delete dic when one left
    lengthDicsList.value = availableDics.length;

    Get.back();
    Get.back();
  }

  void resetDic(String storageName) {
    dicsDataStorage.writeFirstElementForDictionary(storageName, 0);
    firstElementCurrentDic.value = 0;
  }

  void addDic(String newDicName) {
    lastCreatedDicIndex++;
    dicsDescriptionStorage.writeLastCreatedDicIndex(lastCreatedDicIndex.value);

    String storageDicName = 'dic_${lastCreatedDicIndex.value}';
    Map<String, dynamic> newDicDescription = {
      'storageName': storageDicName,
      'humanName': newDicName,
    };

    availableDics.add(newDicDescription);
    dicsDescriptionStorage.writeAvailableDics(availableDics);

    lastOpenedDic.value = storageDicName;
    dicsDescriptionStorage.writeLastOpenedDic(lastOpenedDic.value);

    Get.back();
    Get.back();
  }
}
