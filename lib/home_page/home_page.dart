import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/widgets/custom_bookmark_button.dart';
import 'package:izimemo/custom/widgets/custom_settings_button.dart';
import 'package:izimemo/custom/widgets/custom_social_button_in_menu.dart';
import 'package:izimemo/home_page/custom_links/default_links.dart';
import 'package:izimemo/home_page/snippets/snippet_appbar_title.dart';
import 'package:izimemo/home_page/snippets/snippet_header_menu.dart';
import 'package:izimemo/home_page/study_widget/study_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../custom/colors/custom_design_colors.dart';
import '../custom/custom_constants.dart';
import '../custom/dialogs.dart';
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

  Dialogs dialogs = Dialogs();

  Future<bool> onGoBack() async {
    if (canGoBack) {
      await webController.goBack();
    } else {
      dialogs.showSnackBar('Backward history is empty');
    }
    return false;
  }

  Future<bool> onGoForward() async {
    if (canGoForward) {
      await webController.goForward();
    } else {
      dialogs.showSnackBar('Forward history is empty');
    }
    return canGoForward;
  }

  Future<void> onReload() async {
    await webController.reload();
  }

  Future<void> onLoadUrl(String url) async {
    if (url != 'about:blank') {
      await webController.loadUrl(Uri.parse(url).toString());
    } else if (canGoBack) {
      await onGoBack();
    } else {
      await webController.loadUrl(Uri.parse('https://www.google.com/').toString());
    }
  }

  Future<void> onUrlEditingComplete() async {
    var urlText = urlTextController.text;
    var loadedUrl = urlText;
    if (urlText.indexOf('http') != 0) {
      loadedUrl = 'http://$urlText';

      var matchCaseOne = RegExp(
              "^(http[s]?:\\/\\/(www\\.)?|ftp:\\/\\/(www\\.)?|www\\.){1}([0-9A-Za-z-\\.@:%_\+~#=]+)+((\\.[a-zA-Z]{2,3})+)(/(.)*)?(\\?(.)*)?",
              caseSensitive: false)
          .firstMatch(loadedUrl);
      var matchCaseTwo =
          RegExp("^([0-9A-Za-z-\\.@:%_\+~#=]+)+((\\.[a-zA-Z]{2,3})+)(/(.)*)?(\\?(.)*)?", caseSensitive: false)
              .firstMatch(loadedUrl);
      if (matchCaseOne != null || matchCaseTwo != null) {
        print('Valid URL');
      } else {
        loadedUrl = 'https://www.google.com/search?q=${urlText.replaceAll(' ', '+')}';
      }
    }
    await onLoadUrl(loadedUrl);
  }

  Future<void> onClearCache() async {
    await webController.clearCache();
    Get.back();
    dialogs.showSnackBar('Cache is deleted');
  }

  Future<void> onClearCookies() async {
    final bool hadCookies = await CookieManager().clearCookies();
    String message = 'Cookies are deleted';
    if (!hadCookies) {
      message = 'Cookies are clean';
    }
    Get.back();
    dialogs.showSnackBar(message);
  }

  Future<void> appBarHeightWhenScrolling() async {
    try {
      webScrollYNew = await webController.getScrollY();
    } catch (e) {
      webScrollYNew = 0;
    }

    if (webScrollYNew > webScrollYOld) {
      appBarAnimationController.forward();
    } else if (webScrollYNew < webScrollYOld) {
      appBarAnimationController.reverse();
    }
    webScrollYOld = webScrollYNew;
  }

  Future<void> onWebError(WebResourceError error) async {
    if (error.errorCode == -2) {
      final searchString = urlTextController.text.replaceAll(' ', '+');
      await onLoadUrl('https://www.google.com/search?q=$searchString');
    }
  }

  void onPageStarted(String url) {
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
  }

  Future<void> onPageFinished(url) async {
    canGoBack = await webController.canGoBack();
    canGoForward = await webController.canGoForward();

    setState(() {
      loadingPercentage = 100;
      canGoBack;
      canGoForward;
    });
  }

  void onProgress(int progress) {
    setState(() {
      loadingPercentage = progress;
    });
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
                        Padding(
                          padding: const EdgeInsets.only(left: 18, top: 4, bottom: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomSocialButtonInMenu(
                                icon: FontAwesomeIcons.shareNodes,
                                title: 'Share opened content with friends',
                                onPressed: () {},
                              ),
                              CustomSocialButtonInMenu(
                                icon: FontAwesomeIcons.solidHeart,
                                title: 'Add opened content to bookmark',
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
                                        onPressed: () {},
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
                          CustomSettingsButton(
                            onPressed: onClearCache,
                            title: 'Clear cache',
                          ),
                          const SizedBox(width: 8),
                          CustomSettingsButton(
                            onPressed: onClearCookies,
                            title: 'Clear cookies',
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
          title: SnippetAppBarTitle(
            onUrlFieldFocus: onUrlFieldFocus,
            loadingPercentage: loadingPercentage,
            urlTextController: urlTextController,
            urlTextFocus: urlTextFocus,
            onUrlEditingComplete: () async {
              urlFieldUnfocused;
              await onUrlEditingComplete();
            },
            // onUrlTap: () {
            //   urlTextController.selection = TextSelection(baseOffset: 0, extentOffset: urlTextController.text.length);
            // },
            onAddBookmarkPressed: () {},
            onStopLoadPressed: () async => await webController.loadUrl('about:blank'),
            onReloadPressed: () async => await onReload(),
            canGoBack: canGoBack,
            onGoBackPressed: () async {
              urlFieldUnfocused;
              await onGoBack();
            },
            canGoForward: canGoForward,
            onGoForwardPressed: () async {
              urlFieldUnfocused;
              await onGoForward();
            },
          ),
          actions: [
            onUrlFieldFocus
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
                    onPressed: () async {
                      urlFieldUnfocused;
                      await onGoForward();
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
                      child: const StudyWidget(),
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
                        onWebResourceError: (error) async => await onWebError(error),
                        onPageStarted: (url) {
                          urlFieldUnfocused;
                          onPageStarted(url);
                        },
                        onPageFinished: (url) async => await onPageFinished(url),
                        onProgress: (progress) => onProgress(progress),
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
