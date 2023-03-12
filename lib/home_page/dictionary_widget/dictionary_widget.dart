import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/colors/custom_design_colors.dart';
import 'package:izimemo/custom/colors/custom_lesson_colors.dart';

import '../../custom/custom_constants.dart';
import 'dictionary_controller.dart';
import 'dictionary_menu_widget.dart';

class DictionaryWidget extends StatelessWidget {
  DictionaryWidget({super.key});

  final DictionaryController dictionaryController = Get.put(DictionaryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            CarouselSlider(
              key: GlobalKey(), // <<< Very important here
              items: [
                ...dictionaryController.sliderWordList.asMap().entries.map(
                  (e) {
                    var splitStrings = e.value.split(' - ');

                    return GestureDetector(
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
                                      leading: Text(
                                        '${double.parse((dictionaryController.firstElementCurrentDic.value / dictionaryController.currentWordList.length).toStringAsFixed(1))}',
                                        style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                      title: Text(
                                        '${'learned'.tr} ${dictionaryController.firstElementCurrentDic.value} ${'of'.tr} ${dictionaryController.currentWordList.length} ${'entries_in_dictionary'.tr}',
                                        style: const TextStyle(color: Colors.white),
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
                                              onPressed: () {},
                                              icon: const Icon(Icons.check_rounded),
                                              label: Text('have_learned'.tr),
                                              style: TextButton.styleFrom(alignment: Alignment.topLeft),
                                            ),
                                            TextButton.icon(
                                              onPressed: () {},
                                              icon: const Icon(Icons.last_page_rounded),
                                              label: Text('move_later'.tr),
                                              style: TextButton.styleFrom(alignment: Alignment.topLeft),
                                            ),
                                            TextButton.icon(
                                              onPressed: () {},
                                              icon: const Icon(Icons.edit_rounded),
                                              label: Text('edit_entry'.tr),
                                              style: TextButton.styleFrom(alignment: Alignment.topLeft),
                                            ),
                                            TextButton.icon(
                                              onPressed: () {},
                                              icon: const Icon(Icons.add_rounded),
                                              label: Text('add_entries'.tr),
                                              style: TextButton.styleFrom(alignment: Alignment.topLeft),
                                            ),
                                            TextButton.icon(
                                              onPressed: () {},
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
                      onVerticalDragEnd: (details) {
                        if (details.velocity.pixelsPerSecond.dy < 1) {
                          print('onVerticalDragEnd');
                        }
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
                          child: AutoSizeText.rich(
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
                // autoPlayInterval: Duration(seconds: settingsPageController.secondsPerEntries.value.round()),
                enlargeFactor: 1,
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
        ));
  }
}
