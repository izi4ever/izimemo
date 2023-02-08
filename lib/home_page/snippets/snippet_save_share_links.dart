import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../custom/widgets/custom_bookmark_button.dart';
import '../../custom/widgets/custom_social_button_in_menu.dart';
import '../custom_links/additional_links.dart';
import '../home_page_controller.dart';

class SnippetSaveShareLinks extends StatelessWidget {
  SnippetSaveShareLinks({
    super.key,
    required this.webController,
  });

  final WebViewController webController;

  // final HomePageController homePageController = Get.put(HomePageController());
  final HomePageController homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
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
              ...AdditionalLinks.values.map(
                (e) {
                  if (e.active == true) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CustomBookmarkButton(
                        title: e.title,
                        url: e.url,
                        onPressed: () async {
                          Get.back();
                          await homePageController.onLoadUrl(webController, e.url);
                        },
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
