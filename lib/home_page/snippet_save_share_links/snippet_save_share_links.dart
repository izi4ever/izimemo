import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/custom_constants.dart';
import 'package:izimemo/custom/widgets/custom_form_label.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../custom/colors/custom_design_colors.dart';
import '../../custom/dialogs.dart';
import '../../custom/widgets/custom_bookmark_button.dart';
import '../../custom/widgets/custom_elevated_button.dart';
import '../../custom/widgets/custom_social_button_in_menu.dart';
import '../../custom/widgets/custom_text_form_field.dart';
import 'snippet_save_share_links_controller.dart';

class SnippetSaveShareLinks extends StatefulWidget {
  const SnippetSaveShareLinks({
    super.key,
    required this.currentUrl,
    required this.webController,
  });

  final String currentUrl;
  final WebViewController webController;

  @override
  State<SnippetSaveShareLinks> createState() => _SnippetSaveShareLinksState();
}

class _SnippetSaveShareLinksState extends State<SnippetSaveShareLinks> {

  final SnippetSaveShareLinksController snippetSaveShareLinksController = Get.put(SnippetSaveShareLinksController());

  final Dialogs dialogs = Dialogs();

  final _titleFieldController = TextEditingController();
  final _linkFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 18, top: 4, bottom: 4),
          child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSocialButtonInMenu(
                icon: FontAwesomeIcons.shareNodes,
                title: 'share_content'.tr,
                onPressed: () {},
              ),
              (!snippetSaveShareLinksController.bookmarksList
                            .map((e) => e['url'])
                            .toList()
                            .contains(widget.currentUrl))
              ? CustomSocialButtonInMenu(
                icon: FontAwesomeIcons.heart,
                title: 'add_bookmark'.tr,
                onPressed: () => dialogs.addBookmarkDialog(widget.webController),
              )
              : CustomSocialButtonInMenu(
                icon: FontAwesomeIcons.solidHeart,
                title: 'delete_bookmark'.tr,
                onPressed: () => snippetSaveShareLinksController.deleteBookmarkByUrl(widget.currentUrl),
              ),
            ],
          )),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Obx(() => Wrap(
                children: [
                  ...snippetSaveShareLinksController.bookmarksList.asMap().entries.map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomBookmarkButton(
                            title: e.value['title']!,
                            url: e.value['url']!,
                            onPressed: () async => await snippetSaveShareLinksController.onBookmarkPressed(widget.webController, e.value['url']),
                            // Dialog for editing and deleting bookmark
                            onLongPress: () {
                              _titleFieldController.text = e.value['title']!;
                              _linkFieldController.text = e.value['url']!;
                              dialogs.showDialog(
                                content: Form(
                                  child: SizedBox(
                                    height: 240,
                                    child: ListView(
                                      children: [
                                        CustomFormLabel(title: 'title'.tr, topPadding: 4),
                                        CustomTextFormField(
                                          controller: _titleFieldController,
                                          maxLength: CustomConstants.urlTitleMaxLength,
                                          maxLengthEnforcement: MaxLengthEnforcement.none,
                                        ),
                                        CustomFormLabel(title: 'link'.tr, topPadding: 0),
                                        CustomTextFormField(
                                          controller: _linkFieldController,
                                          maxLines: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  CustomElevatedButton(
                                    onPressed: () => snippetSaveShareLinksController.changeBookmark(
                                      e.key,
                                      _titleFieldController.text,
                                      _linkFieldController.text,
                                    ),
                                    title: 'save'.tr,
                                  ),
                                  CustomElevatedButton(
                                    onPressed: () => Get.back(),
                                    title: 'cancel'.tr,
                                    backgroundColor: CustomDesignColors.mediumBlue,
                                    foregroundColor: CustomDesignColors.darkBlue,
                                  ),
                                  TextButton(
                                    onPressed: () => snippetSaveShareLinksController.deleteBookmarkByIndex(e.key),
                                    child: Text('delete'.tr),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                ],
              )),
        )
      ],
    );
  }

  @override
  void dispose() {
    _titleFieldController.dispose();
    _linkFieldController.dispose();

    super.dispose();
  }
}
