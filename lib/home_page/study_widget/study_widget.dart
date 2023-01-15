import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/colors/custom_design_colors.dart';
import 'package:izimemo/custom/colors/custom_lesson_colors.dart';
import 'package:izimemo/home_page/study_widget/study_widget_controller.dart';
import 'package:izimemo/home_page/study_widget/test_study_settings.dart';

import '../../custom/custom_constants.dart';
import 'test_word_list.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

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

    String? selectedMenu;

    return Obx(() => Stack(
          children: [
            CarouselSlider(
              items: [
                ...items.asMap().entries.map(
                  (e) {
                    var splitStrings = e.value.split(' - ');

                    return GestureDetector(
                      onTap: () {
                        print('onTap');
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
                                      title: const Text(
                                        'You\'ve learned 73 of 1000 entries in this dictionary',
                                        style: TextStyle(color: Colors.white),
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
                                              icon: Icon(Icons.check_rounded),
                                              label: Text('I\'ve learned this entry (swipe up on card)'),
                                              style: TextButton.styleFrom(alignment: Alignment.topLeft),
                                            ),
                                            TextButton.icon(
                                              onPressed: () {},
                                              icon: Icon(Icons.last_page_rounded),
                                              label: Text('Move this enrty on later'),
                                              style: TextButton.styleFrom(alignment: Alignment.topLeft),
                                            ),
                                            TextButton.icon(
                                              onPressed: () {},
                                              icon: Icon(Icons.edit_rounded),
                                              label: Text('Edit this entry'),
                                              style: TextButton.styleFrom(alignment: Alignment.topLeft),
                                            ),
                                            TextButton.icon(
                                              onPressed: () {},
                                              icon: Icon(Icons.add_rounded),
                                              label: Text('Add new entries'),
                                              style: TextButton.styleFrom(alignment: Alignment.topLeft),
                                            ),
                                            TextButton.icon(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.delete_forever_outlined,
                                                color: Colors.red[200],
                                              ),
                                              label: Text(
                                                'Delete this entry',
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
                      // onPanUpdate: (details) {
                      //   if (details.delta.dy < 0) {
                      //     print('Swipe up');
                      //   }
                      // },
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
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(
                  //     Icons.more_vert,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  PopupMenuButton(
                    initialValue: selectedMenu,
                    onSelected: (value) {
                      print(value);
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'menu_3',
                        child: ListTile(
                          trailing: Icon(Icons.switch_left_rounded),
                          // leading: Icon(Icons.),
                          title: Text('EN-RU TOP-1000'),
                          minLeadingWidth: 0,
                          minVerticalPadding: 0,
                          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'menu_3',
                        child: ListTile(
                          trailing: Icon(Icons.switch_left_rounded),
                          // leading: Icon(Icons.),
                          title: Text('DE-RU TOP-1000'),
                          minLeadingWidth: 0,
                          minVerticalPadding: 0,
                          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                        ),
                      ),
                      PopupMenuItem<String>(
                        key: const ValueKey(0),
                        value: 'menu_3',
                        child: ClipRRect(
                          child: Slidable(
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (BuildContext context) {},
                                  backgroundColor: Colors.white,
                                  // foregroundColor: Colors.white,
                                  foregroundColor: Colors.grey,
                                  icon: Icons.edit_rounded,
                                  // label: 'Edit',
                                  borderRadius: BorderRadius.circular(100),
                                  spacing: 0,
                                  padding: EdgeInsets.zero,
                                ),
                                SlidableAction(
                                  onPressed: (BuildContext context) {},
                                  backgroundColor: Colors.white,
                                  // foregroundColor: Colors.red,
                                  // foregroundColor: Colors.grey,
                                  foregroundColor: Colors.red[200],
                                  icon: FontAwesomeIcons.trashCan,
                                  // label: 'Edit',
                                  borderRadius: BorderRadius.circular(100),
                                  spacing: 0,
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                            child: const ListTile(
                              trailing: Icon(Icons.switch_left_rounded),
                              // leading: Icon(Icons.),
                              title: Text('FR-RU TOP-1000'),
                              minLeadingWidth: 0,
                              minVerticalPadding: 0,
                              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                            ),
                          ),
                        ),
                      ),
                      const PopupMenuDivider(),
                      const PopupMenuItem<String>(
                        value: 'create_dictionary',
                        // padding: EdgeInsets.zero,
                        child: ListTile(
                          leading: Icon(Icons.add),
                          title: Text('Create dictionary'),
                          minLeadingWidth: 0,
                          minVerticalPadding: 0,
                          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                        ),
                      ),
                    ],
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    // color: CustomDesignColors.lightBlue,
                    // color: CustomDesignColors.mediumBlue,
                    color: CustomDesignColors.menuBlue,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
