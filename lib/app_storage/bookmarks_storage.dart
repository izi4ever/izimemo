import 'package:get_storage/get_storage.dart';

class BookmarksStorage {
  final box = GetStorage();

  List<Map<String, dynamic>> get readBookmarksList =>
      List<Map<String, dynamic>>.from(box.read('bookmarksList') ??
      [
        {
          'title': 'Ukr.net',
          'url': 'https://www.ukr.net/',
        },
        {
          'title': 'Filmster',
          'url': 'https://www.youtube.com/@FilmsterRu/playlists',
        },
        {
          'title': 'VideoLand',
          'url': 'https://www.youtube.com/@cdlandvideo/playlists',
        },
      ]);

  void writeBookmarksList(List<Map<String, dynamic>> value) => box.write('bookmarksList', value);
}
