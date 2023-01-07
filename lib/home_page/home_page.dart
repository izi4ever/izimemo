import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/widgets/custom_bookmark_button.dart';
import 'package:izimemo/custom/widgets/custom_social_button_in_menu.dart';
import 'package:izimemo/home_page/custom_links/default_links.dart';
import 'package:izimemo/home_page/home_page_controller.dart';
import 'package:izimemo/home_page/snippets/snippet_appbar_title.dart';
import 'package:izimemo/home_page/snippets/snippet_header_menu.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../custom/colors/custom_design_colors.dart';
import '../custom/custom_constants.dart';
import '../custom/widgets/custom_settings_icon_button.dart';
import 'custom_links/additional_links.dart';
import 'study_widget/study_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late WebViewController webController;
  final TextEditingController urlTextController = TextEditingController();
  late FocusNode urlTextFocus;
  late AnimationController appBarAnimationController;
  late Animation appBarSizeAnimation;
  late bool onUrlFieldFocus;

  var webScrollYOld = 0;
  var webScrollYNew = 0;

  void get urlFieldUnfocused => FocusManager.instance.primaryFocus?.unfocus();

  HomePageController homePageController = HomePageController();

  Future<void> appBarHeightWhenScrolling() async {
    try {
      webScrollYNew = await webController.getScrollY();
    } catch (e) {
      webScrollYNew = 0;
      print('getScrollY catch error: $e');
    }

    if (webScrollYNew > webScrollYOld) {
      appBarAnimationController.forward();
    } else if (webScrollYNew < webScrollYOld) {
      appBarAnimationController.reverse();
    }
    webScrollYOld = webScrollYNew;
  }

  @override
  void initState() {
    super.initState();

    urlTextFocus = FocusNode();
    onUrlFieldFocus = urlTextFocus.hasFocus;
    urlTextFocus.addListener(() {
      setState(() {
        onUrlFieldFocus = urlTextFocus.hasFocus;
      });
      if (urlTextFocus.hasFocus) {
        urlTextController.text = homePageController.fullUrl;
      } else {
        urlTextController.text = homePageController.shortUrl;
      }
    });

    appBarAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    appBarSizeAnimation = Tween<double>(begin: CustomConstants.appBarHeight, end: 0.0)
        .animate(CurvedAnimation(parent: appBarAnimationController, curve: Curves.easeIn));
    appBarAnimationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await homePageController.onGoBack(webController),
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(
          backgroundColor: CustomDesignColors.lightBlue,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SnippetHeaderMenu(
                      releaseNo: 'v1.0.3',
                      onLogoPressed: () {},
                      onLikePressed: () {},
                      onSharedPressed: () {},
                      onQRPressed: () {},
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Wrap(
                            children: [
                              ...DefaultLinks.values.map(
                                (e) {
                                  if (e.active == true) {
                                    return IconButton(
                                      onPressed: () async {
                                        Get.back();
                                        await homePageController.onLoadUrl(webController, e.url);
                                      },
                                      icon: Image.asset('assets/bookmarks/${e.imageFileName}'),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.only(left: 18, top: 4, bottom: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomSocialButtonInMenu(
                                icon: FontAwesomeIcons.shareNodes,
                                title: 'share_content'.tr,
                                onPressed: () {},
                              ),
                              CustomSocialButtonInMenu(
                                icon: FontAwesomeIcons.solidHeart,
                                title: 'add_bookmark'.tr,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Wrap(
                            children: [
                              ...AdditionalLinks.values.map(
                                (e) {
                                  if (e.active == true) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: CustomBookmarkButton(
                                        title: e.title,
                                        url: e.url,
                                        onPressed: () async {
                                          Get.back();
                                          await homePageController.onLoadUrl(webController, e.url);
                                        },
                                      ),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(height: 0),
              Padding(
                padding: (MediaQuery.of(context).orientation == Orientation.portrait)
                    ? const EdgeInsets.only(top: 10, bottom: 10, left: 12, right: 4)
                    : const EdgeInsets.only(top: 4, bottom: 4, left: 12, right: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          CustomSettingsIconButton(
                            onPressed: () async => await homePageController.onClearCache(webController),
                            title: 'clear_cache'.tr,
                            icon: FontAwesomeIcons.trashCan,
                          ),
                          const SizedBox(width: 10),
                          CustomSettingsIconButton(
                            onPressed: () async => await homePageController.onClearCookies(),
                            title: 'clear_cookies'.tr,
                            icon: FontAwesomeIcons.trashCan,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          toolbarHeight: appBarSizeAnimation.value,
          title: Obx(() => SnippetAppBarTitle(
                onUrlFieldFocus: onUrlFieldFocus,
                loadingPercentage: homePageController.loadingPercentage.value,
                urlTextController: urlTextController,
                urlTextFocus: urlTextFocus,
                onUrlEditingComplete: () async {
                  urlFieldUnfocused;
                  await homePageController.onUrlEditingComplete(webController, urlTextController.text);
                },
                // onUrlTap: () {
                //   urlTextController.selection = TextSelection(baseOffset: 0, extentOffset: urlTextController.text.length);
                // },
                onAddBookmarkPressed: () {},
                onStopLoadPressed: () async => await webController.loadUrl('about:blank'),
                onReloadPressed: () async => await homePageController.onReload(webController),
                canGoBack: homePageController.canGoBack.value,
                onGoBackPressed: () async {
                  urlFieldUnfocused;
                  await homePageController.onGoBack(webController);
                },
                canGoForward: homePageController.canGoForward.value,
                onGoForwardPressed: () async {
                  urlFieldUnfocused;
                  await homePageController.onGoForward(webController);
                },
              )),
          actions: [
            onUrlFieldFocus
                ? const SizedBox(width: 16)
                : Obx(() => IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: homePageController.canGoBack.isTrue ? const Color(0xFFFFFFFF) : const Color(0x55FFFFFF),
                      ),
                      onPressed: () async => await homePageController.onGoBack(webController),
                    )),
            onUrlFieldFocus
                ? const SizedBox.shrink()
                : IconButton(
                    icon: Obx(() => Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: homePageController.canGoForward.isTrue
                              ? const Color(0xFFFFFFFF)
                              : const Color(0x55FFFFFF),
                        )),
                    onPressed: () async {
                      urlFieldUnfocused;
                      await homePageController.onGoForward(webController);
                    },
                  ),
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    color: CustomDesignColors.darkBlue,
                    height: CustomConstants.webviewRadius,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    // top: 0 + CustomConstants.webviewRadius,
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
                      // child: const StudyWidget(),
                      child: StudyWidget(),
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
                      child: WebView(
                        onWebViewCreated: (controller) => webController = controller,
                        javascriptMode: JavascriptMode.unrestricted,
                        initialUrl: 'google.com',
                        onWebResourceError: (error) async =>
                            await homePageController.onWebError(webController, error, urlTextController.text),
                        onPageStarted: (url) {
                          urlFieldUnfocused;
                          urlTextController.text = homePageController.onPageStarted(url);
                        },
                        onPageFinished: (url) async => await homePageController.onPageFinished(webController, url),
                        onProgress: (progress) => homePageController.onProgress(progress),
                        gestureRecognizers: Set()
                          ..add(
                            Factory<VerticalDragGestureRecognizer>(
                              () => VerticalDragGestureRecognizer()
                                ..onDown = (tap) async {
                                  urlFieldUnfocused;
                                  await appBarHeightWhenScrolling();
                                },
                            ),
                          ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    urlTextFocus.dispose();
    urlTextController.dispose();
    appBarAnimationController.dispose();

    super.dispose();
  }
}
