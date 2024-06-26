import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/available_languages.dart';
import 'package:izimemo/custom/widgets/custom_dropdown_button.dart';
import 'package:izimemo/home_page/dictionary_widget/dictionary_controller.dart';

import '../../custom/colors/custom_design_colors.dart';
import '../../custom/custom_constants.dart';
import '../../custom/dialogs.dart';
import '../../custom/widgets/custom_elevated_button.dart';
import '../../custom/widgets/custom_form_label.dart';
import '../../custom/widgets/custom_text_form_field.dart';

class DictionaryMenuWidget extends StatelessWidget {
  DictionaryMenuWidget({super.key});

  final DictionaryController dictionaryController = Get.put(DictionaryController());

  final Dialogs dialogs = Dialogs();

  final _dicNameFieldController = TextEditingController();

  final _newDicNameFieldController = TextEditingController();
  final _newEntriesFieldController = TextEditingController();

  final formCreateKey = GlobalKey<FormState>();
  final formRenameKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // TODO Was error with this State in stream. Test it latter
      // List<Map<String, dynamic>> dicsList = dictionaryController.availableDics;
      // List<Map<String, dynamic>> dicsList = dictionaryController.availableDicsDataList.value;
      List<Map<String, dynamic>> dicsList = dictionaryController.availableDicsDataList;
      return PopupMenuButton(
        initialValue: dictionaryController.lastOpenedDic.value,
        onSelected: (value) {
          if (value != 'create_dictionary') {
            dictionaryController.changeCurrentDic(value);
          } else {
            dialogs.showDialog(
              widthRatio: 0.8,
              content: Form(
                key: formCreateKey,
                child: SizedBox(
                  height: 330,
                  child: ListView(
                    children: [
                      CustomFormLabel(
                        title: 'enter_new_dic_title'.tr,
                        topPadding: 0,
                        horizontalPadding: 0,
                        fontSize: 14,
                      ),
                      CustomTextFormField(
                        controller: _newDicNameFieldController,
                        maxLength: CustomConstants.urlTitleMaxLength,
                        maxLengthEnforcement: MaxLengthEnforcement.none,
                        autofocus: true,
                        validator: (val) {
                          if (_newDicNameFieldController.text.length > CustomConstants.urlTitleMaxLength) {
                            return 'too_long_title'.tr;
                          } else if (_newDicNameFieldController.text.isEmpty) {
                            return 'empty_field'.tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomFormLabel(
                        // title: 'important_for_pronunciation'.tr,
                        title: 'translation_direction'.tr,
                        topPadding: 4,
                        horizontalPadding: 0,
                        fontSize: 14,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomDropdownButton(
                                hintText: 'from_language'.tr,
                                // items: dictionaryController.availableLanguages,
                                items: AvailableLanguages.getList,
                                onChanged: (String? value) => dictionaryController.formFromLanguage.value = value!,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 1,
                              child: CustomDropdownButton(
                                hintText: 'to_language'.tr,
                                // items: dictionaryController.availableLanguages,
                                items: AvailableLanguages.getList,
                                onChanged: (String? value) => dictionaryController.formToLanguage.value = value!,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomFormLabel(
                        // title: '${'add_at_least_one_entry'.tr} ${'add_new_entry'.tr}',
                        title: 'how_add_new_entries'.tr,
                        topPadding: 4,
                        horizontalPadding: 0,
                        fontSize: 14,
                      ),
                      CustomTextFormField(
                        controller: _newEntriesFieldController,
                        maxLines: 3,
                        validator: (val) {
                          if (_newEntriesFieldController.text.isEmpty) {
                            return 'empty_field'.tr;
                          } else {
                            return null;
                          }
                        },
                      ),

                      // TODO isReverseOrder
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Obx(
                            () => Switch(
                              value: dictionaryController.reverseOrder.value,
                              // activeColor: CustomDesignColors.darkBlue,
                              activeTrackColor: CustomDesignColors.darkBlue,
                              activeColor: CustomDesignColors.lightBlue,
                              inactiveTrackColor: CustomDesignColors.lightBlue,
                              inactiveThumbColor: CustomDesignColors.mediumBlue,
                              onChanged: (bool value) => dictionaryController.onChangedReverseOrder(value),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: CustomFormLabel(
                              title: 'reverse_order'.tr,
                              topPadding: 12,
                              horizontalPadding: 0,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                CustomElevatedButton(
                  onPressed: () {
                    if (formCreateKey.currentState!.validate()) {
                      formCreateKey.currentState!.save();
                      dictionaryController.addDic(
                        _newDicNameFieldController.text,
                        _newEntriesFieldController.text,
                      );
                    }
                  },
                  title: 'create'.tr,
                ),
                CustomElevatedButton(
                  onPressed: () => Get.back(),
                  title: 'cancel'.tr,
                  backgroundColor: CustomDesignColors.mediumBlue,
                  foregroundColor: CustomDesignColors.darkBlue,
                ),
              ],
            );
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          // Instead of top padding
          const PopupMenuItem(height: 4, child: SizedBox.shrink()),
          ...dicsList.asMap().entries.map(
                // ...dictionaryMenuWidgetController.availableDics.value.asMap().entries.map(
                (e) => PopupMenuItem(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  key: ValueKey(e.value['storageName']),
                  value: e.value['storageName'],
                  // ClipRRect is for cropping element name behind menu border
                  child: ClipRRect(
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        extentRatio: 0.7,
                        children: [
                          // >>> EDIT DIC
                          SlidableAction(
                            onPressed: (BuildContext context) {
                              _dicNameFieldController.text = e.value['humanName']!;
                              dialogs.showDialog(
                                widthRatio: 0.8,
                                content: Form(
                                  key: formRenameKey,
                                  child: SizedBox(
                                    height: 240,
                                    child: ListView(
                                      children: [
                                        CustomFormLabel(title: 'title'.tr, topPadding: 4),
                                        CustomTextFormField(
                                          controller: _dicNameFieldController,
                                          maxLength: CustomConstants.urlTitleMaxLength,
                                          maxLengthEnforcement: MaxLengthEnforcement.none,
                                          validator: (val) {
                                            if (_dicNameFieldController.text.length >
                                                CustomConstants.urlTitleMaxLength) {
                                              return 'too_long_title'.tr;
                                            } else if (_dicNameFieldController.text.isEmpty) {
                                              return 'empty_field'.tr;
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                        CustomFormLabel(
                                          // title: 'important_for_pronunciation'.tr,
                                          title: 'translation_direction'.tr,
                                          topPadding: 4,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 12),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: CustomDropdownButton(
                                                  hintText: 'from_language'.tr,
                                                  defaultValue: dictionaryController
                                                      .getFromLanguageByStorageName(e.value['storageName']),
                                                  // items: dictionaryController.availableLanguages,
                                                  items: AvailableLanguages.getList,
                                                  onChanged: (String? value) =>
                                                      dictionaryController.formFromLanguage.value = value!,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                flex: 1,
                                                child: CustomDropdownButton(
                                                  hintText: 'to_language'.tr,
                                                  defaultValue: dictionaryController
                                                      .getToLanguageByStorageName(e.value['storageName']),
                                                  // items: dictionaryController.availableLanguages,
                                                  items: AvailableLanguages.getList,
                                                  onChanged: (String? value) =>
                                                      dictionaryController.formToLanguage.value = value!,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  CustomElevatedButton(
                                    onPressed: () {
                                      if (formRenameKey.currentState!.validate()) {
                                        formRenameKey.currentState!.save();
                                        dictionaryController.editDicNameAndLanguage(
                                          e.key,
                                          _dicNameFieldController.text,
                                        );
                                      }
                                    },
                                    title: 'save'.tr,
                                  ),
                                  CustomElevatedButton(
                                    onPressed: () => Get.back(),
                                    title: 'cancel'.tr,
                                    backgroundColor: CustomDesignColors.mediumBlue,
                                    foregroundColor: CustomDesignColors.darkBlue,
                                  ),
                                ],
                              );
                            },
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey,
                            icon: Icons.edit_rounded,
                            // label: 'Edit',
                            borderRadius: BorderRadius.circular(100),
                            spacing: 0,
                            padding: EdgeInsets.zero,
                          ),

                          // >>> RESET DIC
                          SlidableAction(
                            onPressed: (BuildContext context) {
                              dialogs.showDialog(
                                content: Text('you_want_reset_dic'.tr),
                                actions: [
                                  CustomElevatedButton(
                                    onPressed: () => dictionaryController.resetDic(e.value['storageName']),
                                    title: 'yes'.tr,
                                  ),
                                  CustomElevatedButton(
                                    onPressed: () => Get.back(),
                                    title: 'no'.tr,
                                    backgroundColor: CustomDesignColors.mediumBlue,
                                    foregroundColor: CustomDesignColors.darkBlue,
                                  ),
                                ],
                              );
                            },
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey,
                            icon: FontAwesomeIcons.arrowRotateLeft,
                            // label: 'Reset',
                            borderRadius: BorderRadius.circular(100),
                            spacing: 0,
                            padding: EdgeInsets.zero,
                          ),

                          // >>> DELETE DIC
                          (dictionaryController.lengthDicsList > 1)
                              ? SlidableAction(
                                  onPressed: (BuildContext context) {
                                    dialogs.showDialog(
                                      content: Text('you_want_delete_dic'.tr),
                                      actions: [
                                        CustomElevatedButton(
                                          onPressed: () => dictionaryController.deleteDic(e.key),
                                          title: 'yes'.tr,
                                          // dictionaryMenuWidgetController.deleteDic(e.key);
                                        ),
                                        CustomElevatedButton(
                                          onPressed: () => Get.back(),
                                          title: 'no'.tr,
                                          backgroundColor: CustomDesignColors.mediumBlue,
                                          foregroundColor: CustomDesignColors.darkBlue,
                                        ),
                                      ],
                                    );
                                  },
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.red[200],
                                  icon: FontAwesomeIcons.trashCan,
                                  // label: 'Delete',
                                  borderRadius: BorderRadius.circular(100),
                                  spacing: 0,
                                  padding: EdgeInsets.zero,
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                      child: ListTile(
                        trailing: const Icon(Icons.switch_left_rounded),
                        title: Text(e.value['humanName']),
                        minLeadingWidth: 0,
                        minVerticalPadding: 0,
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      ),
                    ),
                  ),
                ),
              ),
          const PopupMenuDivider(),
          PopupMenuItem<String>(
            value: 'create_dictionary',
            // padding: EdgeInsets.zero,
            child: ListTile(
              leading: const Icon(Icons.add),
              title: Text('create_dictionary'.tr),
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            ),
          ),
        ],
        elevation: 0,
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        color: CustomDesignColors.menuBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        clipBehavior: Clip.hardEdge,
      );
    });
  }
}
