import 'package:flutter/material.dart';

import '../../home_page/dictionary_widget/dictionary_widget.dart';
import '../colors/custom_design_colors.dart';
import '../custom_constants.dart';

class CustomScaffoldWithStudy extends StatelessWidget {
  const CustomScaffoldWithStudy({
    super.key,
    required this.appBarTitle,
    this.centerTitle = true,
    this.actions,
    this.appBarColor = CustomDesignColors.lightBlue,
    this.appBarTitleColor = CustomDesignColors.darkBlue,
    this.bodyColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    required this.child,
    this.dictionaryWidget,
  });

  final String appBarTitle;
  final bool centerTitle;
  final List<Widget>? actions;
  final Color? appBarColor;
  final Color? appBarTitleColor;
  final Color? bodyColor;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final Widget? dictionaryWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: centerTitle,
        backgroundColor: appBarColor,
        foregroundColor: appBarTitleColor,
        elevation: 0,
        actions: actions,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: appBarColor,
                  height: CustomConstants.webviewRadius,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      // If keyboard is/not active
                      bottomLeft: (MediaQuery.of(context).viewInsets.bottom == 0)
                          ? const Radius.circular(CustomConstants.lessonRadius)
                          : const Radius.circular(0),
                      bottomRight: (MediaQuery.of(context).viewInsets.bottom == 0)
                          ? const Radius.circular(CustomConstants.lessonRadius)
                          : const Radius.circular(0),
                    ),
                    child: dictionaryWidget ?? DictionaryWidget(),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  // If keyboard is/not active
                  bottom: (MediaQuery.of(context).viewInsets.bottom == 0)
                      ? (MediaQuery.of(context).orientation == Orientation.portrait)
                          ? CustomConstants.lessonHeightPortrait
                          : CustomConstants.lessonHeightLandscape
                      : 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(CustomConstants.webviewRadius),
                      topRight: const Radius.circular(CustomConstants.webviewRadius),
                      // If keyboard is/not active
                      bottomLeft: (MediaQuery.of(context).viewInsets.bottom == 0)
                          ? const Radius.circular(CustomConstants.webviewRadius)
                          : const Radius.circular(0),
                      bottomRight: (MediaQuery.of(context).viewInsets.bottom == 0)
                          ? const Radius.circular(CustomConstants.webviewRadius)
                          : const Radius.circular(0),
                    ),
                    child: Container(
                      color: bodyColor,
                      padding: padding,
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
