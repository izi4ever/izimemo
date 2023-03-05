import 'package:get/get.dart';
import 'package:izimemo/app_storage/dics_description_storage.dart';

class DictionaryMenuWidgetController extends GetxController {
  final DicsDescriptionStorage dicsDescriptionStorage = DicsDescriptionStorage();

  late RxInt lastCreatedDicIndex;
  late RxString lastOpenedDic;
  late RxList<Map<String, dynamic>> availableDics;

  DictionaryMenuWidgetController() {
    lastCreatedDicIndex = dicsDescriptionStorage.readLastCreatedDicIndex.obs;
    lastOpenedDic = dicsDescriptionStorage.readLastOpenedDic.obs;
    availableDics = dicsDescriptionStorage.readAvailableDics.obs;
  }

  void changeCurrentDic(String currentDic) {
    lastOpenedDic.value = currentDic;
    dicsDescriptionStorage.writeLastOpenedDic(currentDic);

    print(dicsDescriptionStorage.readLastOpenedDic);
  }

  // TODO Rename dic
  void renameDic(int dicIndex, String newDicName) {
    availableDics[dicIndex]['humanName'] = newDicName;
    // availableDics[dicIndex] = {
    //   'storageName': availableDics[dicIndex]['storageName'],
    //   'humanName': newDicName,
    // };
    // availableDics.refresh();
    dicsDescriptionStorage.writeAvailableDics(availableDics);
    Get.back();
  }

  // TODO Delete dic
  void deleteDic(int dicIndex) {
    availableDics.removeAt(dicIndex);
    availableDics.refresh();
    dicsDescriptionStorage.writeAvailableDics(availableDics);
  }
  // TODO Add dic
}
