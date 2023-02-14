import 'package:get_storage/get_storage.dart';

class BookmarksStorage {
  final box = GetStorage();

  List<Map<String, String>> get readBookmarksList =>
      box.read('bookmarksList') ??
      [
        {
          'title': 'Megogo',
          'url': 'https://megogo.net/ua/',
        },
        {
          'title': 'OLX',
          'url': 'https://m.olx.ua/',
        },
        {
          'title': 'Ukr.net',
          'url': 'https://www.ukr.net/',
        },
      ];

  void writeBookmarksList(List<Map<String, String>> value) => box.write('bookmarksList', value);
}
