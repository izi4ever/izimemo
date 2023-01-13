import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/colors/custom_lesson_colors.dart';
import 'package:izimemo/home_page/study_widget/study_widget_controller.dart';
import 'package:izimemo/home_page/study_widget/test_study_settings.dart';

import '../../custom/custom_constants.dart';
import 'test_word_list.dart';

class StudyWidget extends StatelessWidget {
  const StudyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final StudyWidgetController studyWidgetController = Get.put(StudyWidgetController());

    var items = studyWidgetController.wordListGenerator(
      testWordList,
      TestStudySettings.firstElement,
      TestStudySettings.elementsInLesson,
    );

    var colorIndexList = studyWidgetController.slideColorListGenerator(items.length);

    return Obx(() => Stack(
          children: [
            CarouselSlider(
              items: [
                ...items.asMap().entries.map(
                  (e) {
                    var splitStrings = e.value.split(' - ');

                    return GestureDetector(
                      onTap: studyWidgetController.playPause,
                      onTapUp: (TapUpDetails tapUpDetails) {},
                      child: Container(
                        padding: EdgeInsets.only(
                          top: (MediaQuery.of(context).orientation == Orientation.portrait)
                              ? CustomConstants.webviewRadius + CustomConstants.lessonRadius
                              : CustomConstants.webviewRadius - 6 + CustomConstants.lessonRadius,
                          bottom: (MediaQuery.of(context).orientation == Orientation.portrait)
                              ? CustomConstants.lessonRadius
                              : CustomConstants.lessonRadius - 6,
                          // left: CustomConstants.lessonRadius,
                          // right: CustomConstants.lessonRadius,
                          left: 40,
                          right: 40,
                        ),
                        color: CustomLessonColors.values[colorIndexList[e.key]].color,
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
                              // color: Colors.white,
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
                autoPlayInterval: const Duration(seconds: TestStudySettings.slideInterval),
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
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
