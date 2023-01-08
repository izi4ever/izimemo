import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:izimemo/custom/colors/custom_lesson_colors.dart';

import '../../custom/custom_constants.dart';
import 'test_word_list.dart';

class StudyWidget extends StatelessWidget {
  StudyWidget({super.key});

  final List<String> items = testWordList;
  int? neighborColorNo;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        ...items.map((e) {
          var splitStrings = e.split(' - ');
          var colorNo = randomColorNumber(neighborColorNo, CustomLessonColors.values.length);
          neighborColorNo = colorNo;

          return Container(
            padding: EdgeInsets.only(
              top: (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? CustomConstants.webviewRadius + CustomConstants.lessonRadius
                  : CustomConstants.webviewRadius - 6 + CustomConstants.lessonRadius,
              bottom: (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? CustomConstants.lessonRadius
                  : CustomConstants.lessonRadius - 6,
              left: CustomConstants.lessonRadius,
              right: CustomConstants.lessonRadius,
            ),
            color: CustomLessonColors.values[colorNo].color,
            child: Center(
              // child: AutoSizeText(
              //   e.replaceFirst(' - ', '\n'),
              //   style: const TextStyle(
              //     fontSize: 20,
              //     color: Colors.white,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
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
          );
        }),
      ],
      options: CarouselOptions(
        height: (MediaQuery.of(context).orientation == Orientation.portrait)
            ? CustomConstants.lessonHeightPortrait + CustomConstants.webviewRadius
            : CustomConstants.lessonHeightLandscape + CustomConstants.webviewRadius,
        autoPlay: true,
        viewportFraction: 1, // Ширина 100%
        pauseAutoPlayInFiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 5),
        enlargeFactor: 1,
      ),
    );
  }

  int randomColorNumber(int? neighborColorNo, int colorLimit) {
    var random = Random();
    var currentRandomValue = neighborColorNo;

    if (currentRandomValue == null) {
      currentRandomValue = random.nextInt(colorLimit);
    } else {
      do {
        currentRandomValue = random.nextInt(colorLimit);
      } while (currentRandomValue == neighborColorNo);
    }

    return currentRandomValue;
  }
}
