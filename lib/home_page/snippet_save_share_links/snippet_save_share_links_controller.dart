import 'package:get/get.dart';
import 'package:izimemo/app_storage/bookmarks_storage.dart';

class SnippetSaveShareLinksController extends GetxController {
  BookmarksStorage bookmarksStorage = BookmarksStorage();

  List<Map<String, dynamic>> get getBookmarksList => bookmarksStorage.readBookmarksList;
  // List<dynamic> get getBookmarksList => bookmarksStorage.readBookmarksList;
  late RxList<Map<String, dynamic>> bookmarksList;
  // late RxList<dynamic> bookmarksList;

  SnippetSaveShareLinksController() {
    bookmarksList = getBookmarksList.obs;
  }

  void deleteBookmarkByIndex(int index) {
    bookmarksList.removeAt(index);
    bookmarksStorage.writeBookmarksList(bookmarksList);

    Get.back();
  }

  // TODO deleteBookmarkByUrl
  void deleteBookmarkByUrl(String url) {}

  void changeBookmark(int index, String newTitle, String newUrl) {
    bookmarksList[index]['title'] = newTitle;
    bookmarksList[index]['url'] = newUrl;

    bookmarksStorage.writeBookmarksList(bookmarksList);

    Get.back();
  }

  // TODO addBookmark
  void addBookmark(String title, String url) {}
}
