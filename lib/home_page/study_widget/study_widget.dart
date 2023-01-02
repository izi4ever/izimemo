import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../custom/colors/custom_lesson_colors.dart';
import '../../custom/custom_constants.dart';

class StudyWidget extends StatelessWidget {
  const StudyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomLessonColors.aquamarine.color,
      height: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? CustomConstants.lessonHeightPortrait + CustomConstants.webviewRadius
          : CustomConstants.lessonHeightLandscape + CustomConstants.webviewRadius,
      padding: const EdgeInsets.only(
        top: CustomConstants.webviewRadius + CustomConstants.lessonRadius,
        bottom: CustomConstants.lessonRadius,
        left: CustomConstants.lessonRadius,
        right: CustomConstants.lessonRadius,
      ),
      // child: const Center(child: Text('Some text to learning')),
      child: const Center(
        child: AutoSizeText(
          'by some reason \n по какой-то причине',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
