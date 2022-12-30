import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izimemo/custom/widgets/custom_widget_styles.dart';
import 'package:izimemo/custom/widgets/custom_bookmark_button.dart';
import 'package:izimemo/home_page/custom_links/default_links.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../custom/custom_constants.dart';
import '../custom/colors/custom_design_colors.dart';
import '../custom/colors/custom_lesson_colors.dart';
import 'custom_links/additional_links.dart';

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
  late String fullUrl;
  late String shortUrl;
  late String inputTextInUrlField;
  var canGoBack = false;
  var canGoForward = false;

  var loadingPercentage = 0;

  var webScrollYOld = 0;
  var webScrollYNew = 0;

  void get urlFieldUnfocused => FocusManager.instance.primaryFocus?.unfocus();

  void showSnackBar(String title) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      messageText: const Text(
        '',
        style: TextStyle(fontSize: 0),
      ),
      duration: const Duration(seconds: 5),
      barBlur: 0,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 12),
      borderRadius: 12,
      backgroundColor: CustomDesignColors.mediumBlue,
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(
        Icons.hdr_strong,
        color: CustomDesignColors.darkBlue,
      ),
      onTap: (snack) => Get.closeCurrentSnackbar(),
    );
  }

  Future<bool> onGoBack() async {
    urlFieldUnfocused;
    if (canGoBack) {
      await webController.goBack();
    } else {
      showSnackBar('Backward history is empty');
    }
    return false;
  }

  Future<bool> onGoForward() async {
    urlFieldUnfocused;
    if (canGoForward) {
      await webController.goForward();
    } else {
      showSnackBar('Forward history is empty');
    }
    return canGoForward;
  }

  void onReload() async {
    urlFieldUnfocused;
    await webController.reload();
  }

  Future<void> onLoadUrl(String url) async {
    // await webController.loadUrl(url);
    var parseUrl = Uri.parse(url).toString();
    await webController.loadUrl(parseUrl);
  }

  Future<void> onLoadUrlField() async {
    urlFieldUnfocused;
    String textFromUrlTextController = urlTextController.text;
    inputTextInUrlField = textFromUrlTextController;
    if (textFromUrlTextController.indexOf('http') != 0) {
      textFromUrlTextController = 'http://$textFromUrlTextController';
    }
    await onLoadUrl(textFromUrlTextController);
  }

  Future<void> onClearCache() async {
    await webController.clearCache();
    Get.back();
    showSnackBar('Cache is deleted');
  }

  Future<void> onClearCookies() async {
    final bool hadCookies = await CookieManager().clearCookies();
    String message = 'Cookies are deleted';
    if (!hadCookies) {
      message = 'Cookies are clean';
    }
    Get.back();
    showSnackBar(message);
  }

  bool buttonShow = false;
  void floatingButtonVisibility() async {
    urlFieldUnfocused;

    // try {
    //   webScrollYNew = await webController.getScrollY();
    //   print('WebScrolling: $webScrollYNew');
    // } catch (e) {
    //   print('WebScrolling: $webScrollYNew');
    //   webScrollYNew = 0;
    //   debugPrint('webController.getScrollY() null exception');
    // }

    // if (webScrollYNew > webScrollYOld) {
    //   appBarAnimationController.forward();
    // } else if (webScrollYNew < webScrollYOld) {
    //   appBarAnimationController.reverse();
    // }
    // webScrollYOld = webScrollYNew;

    webScrollYNew = await webController.getScrollY();
    // print('WebScrolling: $webScrollYNew');
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
        urlTextController.text = fullUrl;
      } else {
        urlTextController.text = shortUrl;
      }
    });

    appBarAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    appBarSizeAnimation = Tween<double>(begin: CustomConstants.appBarHeight, end: 0.0)
        // .animate(appBarAnimationController);
        // .animate(CurvedAnimation(parent: appBarAnimationController, curve: Curves.decelerate));
        .animate(CurvedAnimation(parent: appBarAnimationController, curve: Curves.easeIn));
    appBarAnimationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onGoBack,
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(
          backgroundColor: CustomDesignColors.lightBlue,
          child: Column(
            children: [
              Stack(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: CustomDesignColors.darkBlue,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          // const SizedBox(height: 4),
                          Image.asset(
                            'assets/izimemo_logo_big_white.png',
                            height: 48,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Izimemo',
                            style: GoogleFonts.lobster(
                              textStyle: const TextStyle(color: CustomDesignColors.lightBlue, fontSize: 22),
                            ),
                          ),
                          const Text(
                            'Learn while relaxing',
                            // 'Relax and learn',
                            // 'Relax and study',
                            style: TextStyle(color: CustomDesignColors.lightBlue, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // top: 35,
                    top: 54,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(3),
                          bottomRight: Radius.circular(3),
                        ),
                        color: Colors.white,
                      ),
                      child: const Text(
                        'v1.0.3',
                        style: TextStyle(color: CustomDesignColors.darkBlue, fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 6,
                    top: 18,
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.thumb_up_alt_outlined,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            // const SizedBox(width: 16),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 14),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.qr_code_2,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 7,
                    child: Container(
                      height: CustomConstants.webviewRadius,
                      decoration: const BoxDecoration(
                        color: CustomDesignColors.lightBlue,
                        borderRadius: BorderRadius.only(
                          // topLeft: Radius.elliptical(500, 30),
                          topRight: Radius.elliptical(500, 30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
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
                                    urlFieldUnfocused;
                                    Navigator.pop(context);
                                    await onLoadUrl(e.link);
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
                    // const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 4, bottom: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.shareNodes,
                              color: CustomDesignColors.greyBlue,
                              size: 18,
                            ),
                            label: const Text(
                              'Share opened content with friends',
                              style: TextStyle(
                                color: CustomDesignColors.darkBlue,
                              ),
                            ),
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: const Size(0, 0)),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.solidHeart,
                              color: CustomDesignColors.greyBlue,
                              size: 18,
                            ),
                            label: const Text(
                              // TODO Добавить эту страницу в закладки
                              'Add opened content to bookmark',
                              style: TextStyle(
                                color: CustomDesignColors.darkBlue,
                              ),
                            ),
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: const Size(0, 0)),
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
              ),
              const Divider(height: 0),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16, left: 12, right: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: onClearCache,
                            style: CustomWidgetStyles.whiteButtonBudge,
                            child: const Text('Clear cache'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: onClearCookies,
                            style: CustomWidgetStyles.whiteButtonBudge,
                            child: const Text('Clear cookies'),
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
          title: SizedBox(
            height: CustomConstants.urlFieldHeight,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(onUrlFieldFocus ? 0 : 0.1),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 150),
                      child: LinearProgressIndicator(
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
                    onEditingComplete: onLoadUrlField,
                    // onTap: () {
                    //   _urlTextController.selection =
                    //       TextSelection(baseOffset: 0, extentOffset: _urlTextController.text.length);
                    // },
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(color: CustomDesignColors.darkBlue),
                    cursorColor: CustomDesignColors.darkBlue,
                    cursorHeight: 22,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 0),
                      prefixIcon: IconButton(
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                        onPressed: () {
                          urlFieldUnfocused;
                        },
                        // icon: const Icon(Icons.star, color: Colors.white),
                        // icon: const Icon(
                        //   CupertinoIcons.heart,
                        //   size: 23,
                        //   color: ThemeDesignColors.darkBlue,
                        // ),
                        icon: const FaIcon(
                          // FontAwesomeIcons.solidHeart,
                          FontAwesomeIcons.heart,
                          size: 20,
                          color: CustomDesignColors.darkBlue,
                        ),
                      ),
                      suffixIcon: onUrlFieldFocus
                          ? IconButton(
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                              onPressed: onLoadUrlField,
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: CustomDesignColors.darkBlue,
                              ),
                            )
                          : (loadingPercentage < 100)
                              ? IconButton(
                                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                                  onPressed: () {
                                    urlFieldUnfocused;
                                    webController.loadUrl("about:blank");
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: CustomDesignColors.darkBlue,
                                  ),
                                )
                              : IconButton(
                                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                                  onPressed: onReload,
                                  icon: const Icon(
                                    Icons.replay,
                                    // CupertinoIcons.arrow_2_circlepath,
                                    // size: 24,
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
          ),
          actions: [
            onUrlFieldFocus
                // ? const SizedBox.shrink()
                ? const SizedBox(width: 16)
                : IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                      color: canGoBack ? const Color(0xFFFFFFFF) : const Color(0x55FFFFFF),
                    ),
                    onPressed: onGoBack,
                  ),
            onUrlFieldFocus
                ? const SizedBox.shrink()
                : IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: canGoForward ? const Color(0xFFFFFFFF) : const Color(0x55FFFFFF),
                    ),
                    onPressed: onGoForward,
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
                    top: 0 + CustomConstants.webviewRadius,
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomLessonColors.aquamarine.color,
                        // color: ThemeColors.amber,
                        borderRadius: BorderRadius.only(
                          // If keyboard is/not active
                          bottomLeft: (MediaQuery.of(context).viewInsets.bottom == 0)
                              ? const Radius.circular(CustomConstants.lessonRadius)
                              : const Radius.circular(0),
                          bottomRight: (MediaQuery.of(context).viewInsets.bottom == 0)
                              ? const Radius.circular(CustomConstants.lessonRadius)
                              : const Radius.circular(0),
                        ),
                      ),
                      height: (MediaQuery.of(context).orientation == Orientation.portrait)
                          ? CustomConstants.lessonHeightPortrait + CustomConstants.webviewRadius
                          : CustomConstants.lessonHeightLandscape + CustomConstants.webviewRadius,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: (MediaQuery.of(context).viewInsets.bottom == 0)
                        ? (MediaQuery.of(context).orientation == Orientation.portrait)
                            ? CustomConstants.lessonHeightPortrait
                            : CustomConstants.lessonHeightLandscape
                        : 0,
                    child: ClipRRect(
                      // borderRadius: (MediaQuery.of(context).viewInsets.bottom == 0)
                      //     ? const BorderRadius.all(Radius.circular(ThemeConstants.webviewRadius))
                      //     : const BorderRadius.all(Radius.circular(0)),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(CustomConstants.webviewRadius),
                        topRight: const Radius.circular(CustomConstants.webviewRadius),
                        bottomLeft: (MediaQuery.of(context).viewInsets.bottom == 0)
                            ? const Radius.circular(CustomConstants.webviewRadius)
                            : const Radius.circular(0),
                        bottomRight: (MediaQuery.of(context).viewInsets.bottom == 0)
                            ? const Radius.circular(CustomConstants.webviewRadius)
                            : const Radius.circular(0),
                      ),
                      child: WebView(
                        initialUrl: 'google.com',
                        onWebResourceError: (error) {
                          final searchString = inputTextInUrlField.replaceAll(' ', '+');
                          onLoadUrl('https://www.google.com/search?q=$searchString');
                        },
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated: (controller) {
                          webController = controller;
                        },
                        onPageStarted: (url) {
                          setState(() {
                            loadingPercentage = 0;
                          });
                          fullUrl = url;
                          final listSplitUrl = url.split('/');
                          shortUrl = listSplitUrl[2];
                          if (shortUrl.substring(0, 4) == 'www.') {
                            shortUrl = shortUrl.substring(4);
                          }
                          urlTextController.text = shortUrl;
                        },
                        onPageFinished: (url) async {
                          canGoBack = await webController.canGoBack();
                          canGoForward = await webController.canGoForward();

                          setState(() {
                            loadingPercentage = 100;
                            canGoBack;
                            canGoForward;
                          });
                        },
                        onProgress: (progress) {
                          setState(() {
                            loadingPercentage = progress;
                          });
                        },
                        gestureRecognizers: Set()
                          ..add(
                            Factory<VerticalDragGestureRecognizer>(
                              () => VerticalDragGestureRecognizer()
                                ..onDown = (tap) {
                                  floatingButtonVisibility();
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
