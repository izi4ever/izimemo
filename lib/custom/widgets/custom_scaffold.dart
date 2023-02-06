import 'package:flutter/material.dart';

import '../colors/custom_design_colors.dart';
import '../custom_constants.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.appBarColor = CustomDesignColors.lightBlue,
    this.appBarTitleColor = CustomDesignColors.darkBlue,
    this.bodyColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.child,
  });

  final Color? appBarColor;
  final Color? appBarTitleColor;
  final Color? bodyColor;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: appBarColor,
        foregroundColor: appBarTitleColor,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            color: appBarColor,
            height: CustomConstants.webviewRadius,
          ),
          ClipRRect(
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
        ],
      ),
    );
  }
}
