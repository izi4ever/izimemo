import 'package:get_storage/get_storage.dart';

class DicsDescriptionStorage {
  final box = GetStorage();

  int get readLastCreatedDicIndex => box.read('lastCreatedDicIndex') ?? 3;
  void writeLastCreatedDicIndex(int value) => box.write('lastCreatedDicIndex', value);

  String get readLastOpenedDic => box.read('lastOpenedDic') ?? 'dic_1';
  void writeLastOpenedDic(String value) => box.write('lastOpenedDic', value);

  List<Map<String, dynamic>> get readAvailableDics => List<Map<String, dynamic>>.from(box.read('availableDics') ??
      [
        {
          'storageName': 'dic_1',
          'humanName': 'En-Ru TOP-1000',
        },
        {
          'storageName': 'dic_2',
          'humanName': 'De-Ru 1000',
        },
        {
          'storageName': 'dic_3',
          'humanName': 'Fr-Ru base',
        },
      ]);

  void writeAvailableDics(List<Map<String, dynamic>> value) => box.write('availableDics', value);
}
