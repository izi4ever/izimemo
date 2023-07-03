import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:izimemo/home_page/custom_links/default_links.dart';
import 'package:izimemo/home_page/dictionary_widget/dictionary_widget.dart';
import 'package:izimemo/home_page/home_page_controller.dart';
import 'package:izimemo/home_page/snippet_save_share_links/snippet_save_share_links.dart';
import 'package:izimemo/home_page/snippets_appbar_menu/snippet_appbar_title.dart';
import 'package:izimemo/home_page/snippets_appbar_menu/snippet_header_menu.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../custom/colors/custom_design_colors.dart';
import '../custom/custom_constants.dart';
import '../custom/widgets/custom_settings_icon_button.dart';
import '../settings_page/settings_page.dart';
import '../video_player_page/video_player_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final WebViewController _webController;

  final HomePageController homePageController = Get.put(HomePageController());

  final TextEditingController urlTextController = TextEditingController();
  late FocusNode urlTextFocus;
  late AnimationController appBarAnimationController;
  late Animation appBarSizeAnimation;
  late bool onUrlFieldFocus;

  void get urlFieldUnfocused => FocusManager.instance.primaryFocus?.unfocus();

  var webScrollYOld = 0;
  var webScrollYNew = 0;

  Future<void> appBarHeightWhenScrolling() async {
    try {
      var webViewOffset = await _webController.getScrollPosition();
      webScrollYNew = webViewOffset.dy.round();
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
        urlTextController.text = homePageController.fullUrl.value;
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

    // Describe webController such to block fullscreen mode in iOS
    late final PlatformWebViewControllerCreationParams platformParams;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      platformParams = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      platformParams = const PlatformWebViewControllerCreationParams();
    }
    final WebViewController webController = WebViewController.fromPlatformCreationParams(platformParams);

    webController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          // onNavigationRequest: (NavigationRequest request) {
          //   if (request.url.contains('youtube')) {
          //     print('>>> youtube request: ${request.url}');
          //     // return NavigationDecision.prevent;
          //   }
          //   print('>>> onNavigationRequest: ${request.url}');
          //   return NavigationDecision.navigate;
          // },
          onPageStarted: (String url) {
            urlFieldUnfocused;
            urlTextController.text = homePageController.onPageStarted(url);
          },
          onProgress: (int progress) => homePageController.onProgress(progress),
          onPageFinished: (String url) async {
            homePageController.onPageFinished(webController, url);
            await Future.delayed(
                const Duration(milliseconds: 7000), () async => await homePageController.setVolume(webController));
          },
          // onWebResourceError: (WebResourceError error) async =>
          //     await homePageController.onWebError(webController, error, urlTextController.text),
          onWebResourceError: (error) => homePageController.saveLastUrl('https://www.google.com/'),
        ),
      )
      ..loadRequest(Uri.parse(homePageController.getLastUrl));

    _webController = webController;

    
  }

  

  // Future<void> openVideo() async {
  //   FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles();
  //   if (filePickerResult != null) {
  //     String? filePath = filePickerResult.files.single.path;
  //     if (filePath != null) {
  //       Get.to(() => VideoPlayerPage(filePath: filePath));
  //     }
  //   }
  // }

  Future<void> openVideoFile() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? videoFile = await imagePicker.pickVideo(source: ImageSource.gallery);
    if (videoFile != null) {
      Get.to(() => VideoPlayerPage(filePath: videoFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => homePageController.onGoBack(_webController),
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
                                      onPressed: () {
                                        Get.back();
                                        homePageController.onLoadUrl(_webController, e.url);
                                      },
                                      icon: Image.asset('assets/bookmarks/${e.imageFileName}'),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                              ),
                              ...[
                                // IconButton(
                                //   icon: Image.asset('assets/bookmarks/002-audio-headset.png'),
                                //   onPressed: () => Get.to(() => const AudioPlayerPage()),
                                // ),
                                IconButton(
                                  icon: Image.asset('assets/bookmarks/001-play-button-1.png'),
                                  onPressed: openVideoFile,
                                ),
                              ],
                            ],
                          ),
                        ),
                        Obx(() => SnippetSaveShareLinks(
                              webController: _webController,
                              currentUrl: homePageController.fullUrl.value,
                            )),
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
                            onPressed: () => homePageController.onClearCache(_webController),
                            title: 'clear_cache'.tr,
                            icon: FontAwesomeIcons.trashCan,
                          ),
                          const SizedBox(width: 10),
                          CustomSettingsIconButton(
                            onPressed: () => homePageController.onClearCookies(),
                            title: 'clear_cookies'.tr,
                            icon: FontAwesomeIcons.trashCan,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () => Get.to(() => SettingsPage()),
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
                onUrlEditingComplete: () {
                  urlFieldUnfocused;
                  homePageController.onUrlEditingComplete(_webController, urlTextController.text);
                },
                // onUrlTap: () {
                //   urlTextController.selection = TextSelection(baseOffset: 0, extentOffset: urlTextController.text.length);
                // },
                // onAddBookmarkPressed: () {},
                onStopLoadPressed: () => homePageController.onLoadUrl(_webController, 'about:blank'),
                onReloadPressed: () => homePageController.onReload(_webController),
                canGoBack: homePageController.canGoBack.value,
                onGoBackPressed: () {
                  urlFieldUnfocused;
                  homePageController.onGoBack(_webController);
                },
                canGoForward: homePageController.canGoForward.value,
                onGoForwardPressed: () {
                  urlFieldUnfocused;
                  homePageController.onGoForward(_webController);
                },
                currentUrl: homePageController.fullUrl.value,
                webController: _webController,
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
                      onPressed: () => homePageController.onGoBack(_webController),
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
                    onPressed: () {
                      urlFieldUnfocused;
                      homePageController.onGoForward(_webController);
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
                      child: DictionaryWidget(),
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
                      child: WebViewWidget(
                        controller: _webController,
                        gestureRecognizers: {
                          Factory<VerticalDragGestureRecognizer>(
                            () => VerticalDragGestureRecognizer()
                              ..onDown = (tap) async {
                                urlFieldUnfocused;
                                await Future.delayed(
                                    const Duration(milliseconds: 500), () async => await appBarHeightWhenScrolling());
                              },
                          ),
                        },
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
