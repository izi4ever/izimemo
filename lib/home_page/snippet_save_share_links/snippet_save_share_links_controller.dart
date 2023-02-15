import 'package:get/get.dart';
import 'package:izimemo/app_storage/bookmarks_storage.dart';

class SnippetSaveShareLinksController extends GetxController {
  BookmarksStorage bookmarksStorage = BookmarksStorage();

  List<Map<String, String>> get getBookmarksList => bookmarksStorage.readBookmarksList;
  late RxList<Map<String, String>> bookmarksList;

  SnippetSaveShareLinksController() {
    bookmarksList = getBookmarksList.obs;
  }
}
