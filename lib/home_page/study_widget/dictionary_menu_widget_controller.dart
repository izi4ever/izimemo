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

  // TODO for changing State? Rx<String?> selectedMenu = null.obs;

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
    availableDics.value[dicIndex]['humanName'] = newDicName;
    // availableDics.refresh();
    dicsDescriptionStorage.writeAvailableDics(availableDics);
    Get.back();
    Get.back();
  }

  void deleteDic(int dicIndex) {
    availableDics.removeAt(dicIndex);
    // availableDics.refresh();
    dicsDescriptionStorage.writeAvailableDics(availableDics);
    lengthDicsList.value = availableDics.length;
    Get.back();
    Get.back();
  }

  void resetDic(String storageName) => dicsDataStorage.writeFirstElementForDictionary(storageName, 0);

  // TODO Add dic
  void addDic() {}
}
