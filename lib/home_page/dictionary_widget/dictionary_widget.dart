import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/colors/custom_design_colors.dart';
import 'package:izimemo/custom/colors/custom_lesson_colors.dart';

import '../../custom/custom_constants.dart';
import '../../custom/dialogs.dart';
import '../../custom/widgets/custom_elevated_button.dart';
import '../../custom/widgets/custom_form_label.dart';
import '../../custom/widgets/custom_text_form_field.dart';
import 'dictionary_controller.dart';
import 'dictionary_menu_widget.dart';

class DictionaryWidget extends StatelessWidget {
  DictionaryWidget({super.key});

  final DictionaryController dictionaryController = Get.put(DictionaryController());

  final Dialogs dialogs = Dialogs();

  final _entryEditFieldController = TextEditingController();
  final _entryEditFormKey = GlobalKey<FormState>();

  final _entryAddFieldController = TextEditingController();
  final _entryAddFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();

    return Obx(() {
      bool lastEntry;
      if ((dictionaryController.sliderWordList.length == 1) &&
          (dictionaryController.firstElementCurrentDic.value == (dictionaryController.currentWordsList.length - 1))) {
        lastEntry = true;
      } else {
        lastEntry = false;
      }

      // If happen RX error in removing last entry
      var sliderWordList = dictionaryController.sliderWordList;
      if (sliderWordList.isEmpty) {
        dictionaryController.resetDic(dictionaryController.lastOpenedDic.value);
      }

      return Stack(
        children: [
          CarouselSlider(
            key: GlobalKey(), // <<< Very important here
            carouselController: carouselController,
            items: [
              // ...dictionaryController.sliderWordList.asMap().entries.map(
              ...sliderWordList.asMap().entries.map(
                (e) {
                  var splitStrings = e.value.split(' - ');

                  return GestureDetector(
                    onLongPress: () => dialogEditEntry(e.key, e.value),
                    onDoubleTap: () {
                      // Have learned entry
                      if (lastEntry) {
                        dialogLastEntry();
                      } else {
                        dictionaryController.learnedEntry(e.key);
                      }
                      // Move entry to end
                      // if (lastEntry) {
                      //   dialogLastEntry();
                      // } else {
                      //   dictionaryController.moveEntry(e.key);
                      // }
                    },
                    // onVerticalDragUpdate: (details) {
                    // Swipe up. Have learned entry
                    // if (details.delta.dy < -8) {
                    //   if (lastEntry) {
                    //     dialogLastEntry();
                    //   } else {
                    //     dictionaryController.learnedEntry(e.key);
                    //   }
                    // }

                    // Swipe down. Move entry to end
                    // if (details.delta.dy > 8) {
                    //   if (lastEntry) {
                    //     dialogLastEntry();
                    //   } else {
                    //     dictionaryController.moveEntry(e.key);
                    //   }
                    // }
                    // },
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          margin: EdgeInsets.only(
                            bottom: (MediaQuery.of(context).orientation == Orientation.portrait)
                                ? CustomConstants.lessonHeightPortrait
                                : CustomConstants.lessonHeightLandscape,
                          ),
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            bottom: 8,
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                            ),
                            child: Container(
                              color: CustomDesignColors.darkBlue,
                              child: Column(
                                children: [
                                  ListTile(
                                    contentPadding: const EdgeInsets.only(
                                      left: 20,
                                      right: 4,
                                      top: 2,
                                      bottom: 2,
                                    ),
                                    horizontalTitleGap: 12,
                                    leading: Text(
                                      '${((dictionaryController.firstElementCurrentDic.value / dictionaryController.currentWordsList.length) * 100).toStringAsFixed(1)}%',
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: AutoSizeText(
                                      '${'learned'.tr} ${dictionaryController.firstElementCurrentDic.value} ${'of'.tr} ${dictionaryController.currentWordsList.length} ${'entries_in_dictionary'.tr}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        // fontSize: 14,
                                      ),
                                      maxLines: 2,
                                    ),
                                    trailing: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        padding: const EdgeInsets.all(0),
                                        elevation: 0,
                                        side: const BorderSide(color: Colors.white),
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      onPressed: () => Get.back(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                          bottomLeft: Radius.circular(14),
                                          bottomRight: Radius.circular(14),
                                        ),
                                        color: CustomDesignColors.lightBlue,
                                      ),
                                      child: ListView(
                                        children: [
                                          const SizedBox(height: 14),
                                          TextButton.icon(
                                            onPressed: () {
                                              if (lastEntry) {
                                                dialogLastEntry();
                                              } else {
                                                dictionaryController.learnedEntry(e.key);
                                                Get.back();
                                              }
                                            },
                                            icon: const Icon(Icons.check_rounded),
                                            // label: Text('have_learned'.tr),
                                            label: Text('skip_entry'.tr),
                                            style: TextButton.styleFrom(alignment: Alignment.topLeft),
                                          ),
                                          // TextButton.icon(
                                          //   onPressed: () {
                                          //     if (lastEntry) {
                                          //       dialogLastEntry();
                                          //     } else {
                                          //       dictionaryController.moveEntry(e.key);
                                          //       Get.back();
                                          //     }
                                          //   },
                                          //   icon: const Icon(Icons.last_page_rounded),
                                          //   label: Text('move_later'.tr),
                                          //   style: TextButton.styleFrom(alignment: Alignment.topLeft),
                                          // ),
                                          TextButton.icon(
                                            onPressed: () => dialogEditEntry(e.key, e.value),
                                            icon: const Icon(Icons.edit_rounded),
                                            label: Text('edit_entry'.tr),
                                            style: TextButton.styleFrom(alignment: Alignment.topLeft),
                                          ),
                                          TextButton.icon(
                                            onPressed: () => dialogAddEntries(),
                                            icon: const Icon(Icons.add_rounded),
                                            label: Text('add_entries'.tr),
                                            style: TextButton.styleFrom(alignment: Alignment.topLeft),
                                          ),
                                          TextButton.icon(
                                            onPressed: () {
                                              dictionaryController.deleteEntry(e.key);
                                              Get.back();
                                            },
                                            icon: Icon(
                                              Icons.delete_forever_outlined,
                                              color: Colors.red[200],
                                            ),
                                            label: Text(
                                              'delete_entry'.tr,
                                              style: TextStyle(color: Colors.red[200]),
                                            ),
                                            style: TextButton.styleFrom(alignment: Alignment.topLeft),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: (MediaQuery.of(context).orientation == Orientation.portrait)
                            ? CustomConstants.webviewRadius + CustomConstants.lessonRadius
                            : CustomConstants.webviewRadius - 6 + CustomConstants.lessonRadius,
                        bottom: (MediaQuery.of(context).orientation == Orientation.portrait)
                            ? CustomConstants.lessonRadius
                            : CustomConstants.lessonRadius - 6,
                        left: 40,
                        right: 40,
                      ),
                      color: CustomLessonColors.values[dictionaryController.slideColorIndexList[e.key]].color,
                      child: Center(
                        child: (splitStrings.length > 1)
                            ? AutoSizeText.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: splitStrings[1],
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const TextSpan(text: '\n'),
                                    TextSpan(
                                      text: splitStrings[0],
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.center,
                              )
                            : AutoSizeText(
                                splitStrings[0],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      ),
                    ),
                  );
                },
              ),
            ],
            options: CarouselOptions(
              height: (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? CustomConstants.lessonHeightPortrait + CustomConstants.webviewRadius
                  : CustomConstants.lessonHeightLandscape + CustomConstants.webviewRadius,
              autoPlay: dictionaryController.autoPlay.value,
              viewportFraction: 1,
              pauseAutoPlayInFiniteScroll: true,
              autoPlayInterval: Duration(seconds: dictionaryController.secondsPerEntries.value.round()),
              enlargeFactor: 1,
              initialPage: dictionaryController.carouselInitialPage.value,
              onPageChanged: (index, reason) async {
                dictionaryController.indexCurrentSlide = index;
                await dictionaryController.slideSpeak(index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: CustomConstants.webviewRadius),
            child: Row(
              children: [
                IconButton(
                  onPressed: dictionaryController.playPause,
                  icon: Icon(
                    dictionaryController.autoPlay.value ? Icons.pause : Icons.play_arrow,
                    color: const Color(0x44FFFFFF),
                  ),
                ),
                const Expanded(child: SizedBox.shrink()),
                DictionaryMenuWidget(),
              ],
            ),
          ),
        ],
      );
    });
  }

  void dialogEditEntry(int eKey, String eValue) {
    _entryEditFieldController.text = eValue;
    dialogs.showDialog(
        content: Form(
          key: _entryEditFormKey,
          child: SizedBox(
            height: 140,
            child: ListView(
              children: [
                CustomFormLabel(title: 'edit_save_entry'.tr, topPadding: 4),
                CustomTextFormField(
                  controller: _entryEditFieldController,
                  autofocus: true,
                  maxLines: 3,
                  validator: (val) {
                    if (_entryEditFieldController.text.isEmpty) {
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
              if (_entryEditFormKey.currentState!.validate()) {
                _entryEditFormKey.currentState!.save();
                dictionaryController.editEntry(eKey, _entryEditFieldController.text);
                Get.back();
                Get.back();
                // Get.to(() => const HomePage());
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
        ]);
  }

  void dialogAddEntries() {
    dialogs.showDialog(
        content: Form(
          key: _entryAddFormKey,
          child: SizedBox(
            height: 240,
            child: ListView(
              children: [
                CustomFormLabel(
                  title: 'add_new_entry'.tr,
                  topPadding: 4,
                  horizontalPadding: 0,
                ),
                CustomTextFormField(
                  controller: _entryAddFieldController,
                  autofocus: true,
                  maxLines: 5,
                  validator: (val) {
                    if (_entryAddFieldController.text.isEmpty) {
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
              if (_entryAddFormKey.currentState!.validate()) {
                _entryAddFormKey.currentState!.save();
                dictionaryController.addEntries(_entryAddFieldController.text);
                Get.back();
                Get.back();
                // Get.to(() => const HomePage());
              }
            },
            title: 'add'.tr,
          ),
          CustomElevatedButton(
            onPressed: () {
              if (_entryAddFormKey.currentState!.validate()) {
                _entryAddFormKey.currentState!.save();
                dictionaryController.addEntriesToEnd(_entryAddFieldController.text);
                Get.back();
                Get.back();
                // Get.to(() => const HomePage());
              }
            },
            title: 'add_to_end'.tr,
            backgroundColor: CustomDesignColors.mediumBlue,
            foregroundColor: CustomDesignColors.darkBlue,
          ),
          TextButton(
            onPressed: () => Get.back(),
            child: Text('cancel'.tr),
          ),
        ]);
  }

  void dialogLastEntry() {
    dialogs.showDialog(
      content: SizedBox(
        height: 340,
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 8),
                Image.asset(
                  'assets/fireworks.png',
                  height: 100,
                ),
                const SizedBox(height: 16),
                Text(
                  'congratulation'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'you_learned'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.cyan,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  onPressed: () => dictionaryController.resetDic(dictionaryController.lastOpenedDic.value),
                  title: 'repeat_from_beginning'.tr,
                ),
                const SizedBox(height: 8),
                CustomElevatedButton(
                  onPressed: () {
                    dialogAddEntries();
                  },
                  title: 'add_new_entries'.tr,
                  backgroundColor: CustomDesignColors.mediumBlue,
                  foregroundColor: CustomDesignColors.darkBlue,
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton.icon(
          onPressed: () => Get.back(),
          label: Text('cancel'.tr),
          icon: const Icon(Icons.close),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
