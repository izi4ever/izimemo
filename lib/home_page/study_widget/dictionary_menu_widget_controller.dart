import 'package:get/get.dart';
import 'package:izimemo/app_storage/dics_description_storage.dart';

class DictionaryMenuWidgetController extends GetxController {
  final DicsDescriptionStorage dicsDescriptionStorage = DicsDescriptionStorage();

  late RxInt lastCreatedDicIndex;
  late RxString lastOpenedDic;
  late RxList<Map<String, dynamic>> availableDics;
  late RxInt lengthDicsList;

  DictionaryMenuWidgetController() {
    lastCreatedDicIndex = dicsDescriptionStorage.readLastCreatedDicIndex.obs;
    lastOpenedDic = dicsDescriptionStorage.readLastOpenedDic.obs;
    availableDics = dicsDescriptionStorage.readAvailableDics.obs;
    lengthDicsList = availableDics.length.obs;
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

  // TODO Reset dic
  void resetDic(String storageName) {
    
  }

  // TODO Add dic
}
