import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../custom/dialogs.dart';

class HomePageController extends GetxController {
  var webController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // onProgress(progress);
          // var loadingPercentage = progress.obs;
          print('onProgress');
        },
        // onPageStarted: (String url) {
        //   // urlFieldUnfocused;
        //   // urlTextController.text = onPageStarted(url);
        // },
        // onPageFinished: (String url) async => await onPageFinished(url),
        // onWebResourceError: (WebResourceError error) async =>
        //                     await onWebError(error, urlTextController.text),
        // onNavigationRequest: (NavigationRequest request) {
        //   if (request.url.startsWith('https://www.youtube.com/')) {
        //     return NavigationDecision.prevent;
        //   }
        //   return NavigationDecision.navigate;
        // },
      ),
    )
    ..loadRequest(Uri.parse('https://google.com/'));

  // @override
  // void onInit() {
  //   print('onInit');
  //   webController.setNavigationDelegate(
  //     NavigationDelegate(
  //       onProgress: (int progress) => onProgress(progress),
  //       onPageStarted: (String url) => onPageStarted(url),
  //       onPageFinished: (String url) async => await onPageFinished(url),
  //     ),
  //   );
  //   super.onInit();
  // }

  var canGoBack = false.obs;
  var canGoForward = false.obs;

  var loadingPercentage = 0.obs;

  late String fullUrl;
  late String shortUrl;

  Dialogs dialogs = Dialogs();

  Future<bool> onGoBack() async {
    if (canGoBack.value) {
      await webController.goBack();
    } else {
      dialogs.showSnackBar('backward_empty'.tr);
    }
    return false;
  }

  Future<RxBool> onGoForward() async {
    if (canGoForward.value) {
      await webController.goForward();
    } else {
      dialogs.showSnackBar('forward_empty'.tr);
    }
    return canGoForward;
  }

  Future<void> onReload() async {
    await webController.reload();
  }

  Future<void> onLoadUrl(String url) async {
    // try {
    //   await webController.loadUrl(Uri.parse(url).toString());
    // } catch (e) {
    //   print('loadUrl error: $e');
    // }

    await webController.loadRequest(Uri.parse(url));

    // if (url != 'about:blank') {
    //   await webController.loadUrl(Uri.parse(url).toString());
    // } else if (canGoBack.value) {
    //   await onGoBack(webController);
    // } else {
    //   await webController.loadUrl(Uri.parse('https://www.google.com/').toString());
    // }
  }

  Future<void> onUrlEditingComplete(String urlTextFromField) async {
    var urlText = urlTextFromField;
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
    dialogs.showSnackBar('cache_deleted'.tr);
  }

  Future<void> onClearCookies() async {
    final bool hadCookies = await WebViewCookieManager().clearCookies();
    String message = 'cookies_deleted'.tr;
    if (!hadCookies) {
      message = 'cookies_clean'.tr;
    }
    Get.back();
    dialogs.showSnackBar(message);
  }

  Future<void> onWebError(WebResourceError error, String urlTextFromField) async {
    if (error.errorCode == -2) {
      final searchString = urlTextFromField.replaceAll(' ', '+');
      await onLoadUrl('https://www.google.com/search?q=$searchString');
    }
  }

  void onPageStarted(String url) {
    print('onPageStarted');
    loadingPercentage.value = 0;
    fullUrl = url;
    final listSplitUrl = url.split('/');
    shortUrl = listSplitUrl[2];
    if (shortUrl.substring(0, 4) == 'www.') {
      shortUrl = shortUrl.substring(4);
    }
    // urlTextController.text = shortUrl;
    // return shortUrl;
  }

  Future<void> onPageFinished(String url) async {
    var canBack = await webController.canGoBack();
    var canForward = await webController.canGoForward();
    canGoBack.value = canBack;
    canGoForward.value = canForward;

    loadingPercentage.value = 100;
  }

  void onProgress(int progress) {
    loadingPercentage.value = progress;
  }
}
