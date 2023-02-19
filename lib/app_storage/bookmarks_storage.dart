import 'package:get_storage/get_storage.dart';

class BookmarksStorage {
  final box = GetStorage();

  List<Map<String, dynamic>> get readBookmarksList =>
  // List<dynamic> get readBookmarksList =>
      List<Map<String, dynamic>>.from(box.read('bookmarksList') ??
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
      ]);

  void writeBookmarksList(List<Map<String, dynamic>> value) => box.write('bookmarksList', value);
  // void writeBookmarksList(List<dynamic> value) => box.write('bookmarksList', value);
}
