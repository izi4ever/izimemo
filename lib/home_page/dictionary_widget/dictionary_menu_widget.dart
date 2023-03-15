import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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

  final formCreateKey = GlobalKey<FormState>();

  final formRenameKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Map<String, dynamic>> dicsList = dictionaryController.availableDics.value;
      return PopupMenuButton(
        initialValue: dictionaryController.lastOpenedDic.value,
        onSelected: (value) {
          if (value != 'create_dictionary') {
            dictionaryController.changeCurrentDic(value);
          } else {
            dialogs.showDialog(
              content: Form(
                key: formCreateKey,
                child: SizedBox(
                  height: 300,
                  child: ListView(
                    children: [
                      CustomFormLabel(
                        title: 'enter_new_dic_title'.tr,
                        topPadding: 4,
                        horizontalPadding: 0,
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
                        title: '${'add_at_least_one_entry'.tr} ${'add_new_entry'.tr}',
                        topPadding: 4,
                        horizontalPadding: 0,
                        fontSize: 14,
                      ),
                      CustomTextFormField(
                        controller: _newDicNameFieldController,
                        maxLines: 3,
                        validator: (val) {
                          if (_newDicNameFieldController.text.isEmpty) {
                            return 'empty_field'.tr;
                          } else {
                            return null;
                          }
                        },
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
                      dictionaryController.addDic(_newDicNameFieldController.text);
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
                  key: ValueKey(e.value['storageName']),
                  value: e.value['storageName'],
                  // ClipRRect is for cropping element name behind menu border
                  child: ClipRRect(
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        extentRatio: 0.7,
                        children: [
                          SlidableAction(
                            onPressed: (BuildContext context) {
                              _dicNameFieldController.text = e.value['humanName']!;
                              dialogs.showDialog(
                                content: Form(
                                  key: formRenameKey,
                                  child: SizedBox(
                                    height: 140,
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
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  CustomElevatedButton(
                                    onPressed: () {
                                      if (formRenameKey.currentState!.validate()) {
                                        formRenameKey.currentState!.save();
                                        dictionaryController.renameDic(
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
