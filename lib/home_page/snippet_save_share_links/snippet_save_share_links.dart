import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../custom/widgets/custom_bookmark_button.dart';
import '../../custom/widgets/custom_social_button_in_menu.dart';
import '../home_page_controller.dart';
import 'snippet_save_share_links_controller.dart';

class SnippetSaveShareLinks extends StatelessWidget {
  SnippetSaveShareLinks({
    super.key,
    required this.webController,
  });

  final WebViewController webController;

  // final HomePageController homePageController = Get.put(HomePageController());
  final HomePageController homePageController = Get.find();
  final SnippetSaveShareLinksController snippetSaveShareLinksController = Get.put(SnippetSaveShareLinksController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 18, top: 4, bottom: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSocialButtonInMenu(
                icon: FontAwesomeIcons.shareNodes,
                title: 'share_content'.tr,
                onPressed: () {},
              ),
              CustomSocialButtonInMenu(
                icon: FontAwesomeIcons.solidHeart,
                title: 'add_bookmark'.tr,
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Wrap(
            children: [
              ...snippetSaveShareLinksController.bookmarksList.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomBookmarkButton(
                    title: e['title']!,
                    url: e['url']!,
                    onPressed: () async {
                      Get.back();
                      await homePageController.onLoadUrl(webController, e['url']!);
                    },
                    // TODO Dialog directly with fields for editing and 3 buttons: Cancel, Save, Delete
                    // TODO onLongPress passes index,
                    onLongPress: snippetSaveShareLinksController.onLongPressBookmark,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
