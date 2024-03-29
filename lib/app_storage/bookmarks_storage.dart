import 'package:get_storage/get_storage.dart';

class BookmarksStorage {
  final box = GetStorage();

  List<Map<String, dynamic>> get readBookmarksList =>
      List<Map<String, dynamic>>.from(box.read('bookmarksList') ??
      [
        {
          'title': 'Filmster',
          'url': 'https://m.youtube.com/@FilmsterRu/playlists',
        },
        {
          'title': 'VideoLand',
          'url': 'https://m.youtube.com/@cdlandvideo/playlists',
        },
        {
          'title': 'Bred\'s Deals',
          'url': 'https://www.bradsdeals.com/',
        },
        {
          'title': 'Ben\'s Bargains',
          'url': 'https://bensbargains.com/',
        },
        {
          'title': 'mydealz',
          'url': 'https://www.mydealz.de/',
        },
        {
          'title': 'idealo',
          'url': 'https://www.idealo.de/',
        },
        {
          'title': 'Skyscanner',
          'url': 'https://www.skyscanner.de/',
        },
        {
          'title': 'Internet Radio',
          'url': 'https://www.internet-radio.com/',
        },
      ]);

  void writeBookmarksList(List<Map<String, dynamic>> value) => box.write('bookmarksList', value);
}
