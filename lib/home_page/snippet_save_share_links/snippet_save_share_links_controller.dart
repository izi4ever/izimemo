import 'package:get/get.dart';
import 'package:izimemo/app_storage/bookmarks_storage.dart';
import 'package:izimemo/home_page/home_page_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SnippetSaveShareLinksController extends GetxController {
  final BookmarksStorage bookmarksStorage = BookmarksStorage();

  List<Map<String, dynamic>> get getBookmarksList => bookmarksStorage.readBookmarksList;
  late RxList<Map<String, dynamic>> bookmarksList;

  final HomePageController homePageController = Get.put(HomePageController());

  SnippetSaveShareLinksController() {
    bookmarksList = getBookmarksList.obs;
  }

  void deleteBookmarkByIndex(int index) {
    bookmarksList.removeAt(index);
    bookmarksStorage.writeBookmarksList(bookmarksList);

    Get.back();
  }

  void deleteBookmarkByUrl(String url) {
    var indexUrlInBookmarksList = bookmarksList
        .map((e) => e['url'])
        .toList()
        .indexOf(homePageController.fullUrl.value);

    bookmarksList.removeAt(indexUrlInBookmarksList);
    bookmarksStorage.writeBookmarksList(bookmarksList);
  }

  void changeBookmark(int index, String newTitle, String newUrl) {
    bookmarksList[index]['title'] = newTitle;
    bookmarksList[index]['url'] = newUrl;

    bookmarksStorage.writeBookmarksList(bookmarksList);

    Get.back();
  }

  void addBookmark(String title, String url) {
    Map<String, dynamic> element = {
      'title': title,
      'url': url,
    };

    bookmarksList.add(element);

    bookmarksStorage.writeBookmarksList(bookmarksList);

    Get.back();
  }

  Future<void> onBookmarkPressed(WebViewController webController, String url) async {
    Get.back();
    await homePageController.onLoadUrl(webController, url);
  }
}
