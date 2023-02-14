import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izimemo/app_storage/bookmarks_storage.dart';
import 'package:izimemo/custom/widgets/custom_elevated_button.dart';

import '../../custom/dialogs.dart';

class SnippetSaveShareLinksController extends GetxController {
  BookmarksStorage bookmarksStorage = BookmarksStorage();
  Dialogs dialogs = Dialogs();

  List<Map<String, String>> get getBookmarksList => bookmarksStorage.readBookmarksList;
  late RxList<Map<String, String>> bookmarksList;

  SnippetSaveShareLinksController() {
    bookmarksList = getBookmarksList.obs;
  }

  void onLongPressBookmark() {
    dialogs.showDialog(
      content: const Text('Dialog content'),
      actions: [
        CustomElevatedButton(
          onPressed: () => Get.back(),
          title: 'Cancel',
        ),
        CustomElevatedButton(
          onPressed: () => Get.back(),
          title: 'Cancel',
        ),
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
