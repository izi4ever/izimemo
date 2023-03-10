import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/colors/custom_design_colors.dart';
import 'package:izimemo/custom/colors/custom_lesson_colors.dart';
import 'package:izimemo/home_page/study_widget/study_widget_controller.dart';

import '../../custom/custom_constants.dart';
import 'dictionary_menu_widget.dart';

class StudyWidget extends StatelessWidget {
  StudyWidget({super.key});

  final StudyWidgetController studyWidgetController = Get.put(StudyWidgetController());
  // final SettingsPageController settingsPageController = Get.put(SettingsPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            CarouselSlider(
              key: GlobalKey(), // <<< Very important here
              items: [
                ...studyWidgetController.sliderWordList.asMap().entries.map(
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
                                      leading: const Text(
                                        '7.3%',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                      title: Text(
                                        '${'learned'.tr} 73 ${'of'.tr} 1000 ${'entries_in_dictionary'.tr}',
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                      trailing: IconButton(
                                        onPressed: () => Get.back(),
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 24,
                                        ),
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
                        color: CustomLessonColors.values[studyWidgetController.slideColorIndexList[e.key]].color,
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
                autoPlay: studyWidgetController.autoPlay.value,
                viewportFraction: 1,
                pauseAutoPlayInFiniteScroll: true,
                autoPlayInterval: Duration(seconds: studyWidgetController.secondsPerEntries.value.round()),
                // autoPlayInterval: Duration(seconds: settingsPageController.secondsPerEntries.value.round()),
                enlargeFactor: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: CustomConstants.webviewRadius),
              child: Row(
                children: [
                  IconButton(
                    onPressed: studyWidgetController.playPause,
                    icon: Icon(
                      studyWidgetController.autoPlay.value ? Icons.pause : Icons.play_arrow,
                      color: const Color(0x44FFFFFF),
                    ),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  const DictionaryMenuWidget(),
                ],
              ),
            ),
          ],
        ));
  }
}
