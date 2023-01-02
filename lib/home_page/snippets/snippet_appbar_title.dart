import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../custom/colors/custom_design_colors.dart';
import '../../custom/custom_constants.dart';

class SnippetAppBarTitle extends StatelessWidget {
  final bool onUrlFieldFocus;
  final int loadingPercentage;
  final TextEditingController urlTextController;
  final FocusNode urlTextFocus;
  final VoidCallback onUrlEditingComplete;
  final VoidCallback? onUrlTap;
  final VoidCallback onAddBookmarkPressed;
  final VoidCallback onStopLoadPressed;
  final VoidCallback onReloadPressed;
  final bool canGoBack;
  final VoidCallback onGoBackPressed;
  final bool canGoForward;
  final VoidCallback onGoForwardPressed;
  const SnippetAppBarTitle({
    super.key,
    required this.onUrlFieldFocus,
    required this.loadingPercentage,
    required this.urlTextController,
    required this.urlTextFocus,
    required this.onUrlEditingComplete,
    this.onUrlTap,
    required this.onAddBookmarkPressed,
    required this.onStopLoadPressed,
    required this.onReloadPressed,
    required this.canGoBack,
    required this.onGoBackPressed,
    required this.canGoForward,
    required this.onGoForwardPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: CustomConstants.urlFieldHeight,
        child: Stack(
          children: [
            Padding(
              // padding: EdgeInsets.all(onUrlFieldFocus ? 0 : 0.1),
              padding: EdgeInsets.all(onUrlFieldFocus ? 0 : 0.1),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 150),
                  child: LinearProgressIndicator(
                    // value: loadingPercentage / 100.0,
                    value: loadingPercentage / 100.0,
                    color: CustomDesignColors.mediumBlue,
                    backgroundColor: Colors.white,
                    minHeight: CustomConstants.urlFieldHeight,
                  ),
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 150),
              child: TextField(
                controller: urlTextController,
                focusNode: urlTextFocus,
                onEditingComplete: onUrlEditingComplete,
                // onTap: () {
                //   _urlTextController.selection =
                //       TextSelection(baseOffset: 0, extentOffset: _urlTextController.text.length);
                // },
                onTap: onUrlTap,
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(color: CustomDesignColors.darkBlue),
                cursorColor: CustomDesignColors.darkBlue,
                cursorHeight: 22,
                cursorWidth: 1,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 0),
                  prefixIcon: IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                    // onPressed: () {
                    //   urlFieldUnfocused;
                    // },
                    onPressed: onAddBookmarkPressed,
                    icon: const FaIcon(
                      FontAwesomeIcons.heart,
                      size: 20,
                      color: CustomDesignColors.darkBlue,
                    ),
                  ),
                  suffixIcon: onUrlFieldFocus
                      ? IconButton(
                          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                          onPressed: onUrlEditingComplete,
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: CustomDesignColors.darkBlue,
                          ),
                        )
                      : (loadingPercentage < 100)
                          ? IconButton(
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                              // onPressed: () {
                              //   webController.loadUrl("about:blank");
                              // },
                              onPressed: onStopLoadPressed,
                              icon: const Icon(
                                Icons.close,
                                color: CustomDesignColors.darkBlue,
                              ),
                            )
                          : IconButton(
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                              // onPressed: onReload,
                              onPressed: onReloadPressed,
                              icon: const Icon(
                                Icons.replay,
                                color: CustomDesignColors.darkBlue,
                              ),
                            ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide(color: CustomDesignColors.darkBlue, width: 2),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide(color: CustomDesignColors.darkBlue, width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide(color: CustomDesignColors.lightBlue, width: 0),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
