import 'package:get_storage/get_storage.dart';

class DicsDescriptionStorage {
  final box = GetStorage();

  Map<String, dynamic> get readDicsInfoStorage => Map<String, dynamic>.from(box.read('dicsInfoStorage') ??
      {
        'lastCreatedDicIndex': 1,
        'lastOpenedDic': 'dic_1',
        'availableDics': [
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
        ],
      });

  void writeDicsInfoStorage(Map<String, dynamic> value) => box.write('dicsInfoStorage', value);
}
