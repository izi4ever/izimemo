import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../custom/dialogs.dart';

class HomePageController extends GetxController {
  var canGoBack = false.obs;
  var canGoForward = false.obs;

  var loadingPercentage = 0.obs;

  late String fullUrl;
  late String shortUrl;

  Dialogs dialogs = Dialogs();

  Future<bool> onGoBack(WebViewController webController) async {
    if (canGoBack.value) {
      await webController.goBack();
    } else {
      dialogs.showSnackBar('Backward history is empty');
    }
    return false;
  }

  Future<RxBool> onGoForward(WebViewController webController) async {
    if (canGoForward.value) {
      await webController.goForward();
    } else {
      dialogs.showSnackBar('Forward history is empty');
    }
    return canGoForward;
  }

  Future<void> onReload(WebViewController webController) async {
    await webController.reload();
  }

  Future<void> onLoadUrl(WebViewController webController, String url) async {
    if (url != 'about:blank') {
      await webController.loadUrl(Uri.parse(url).toString());
    } else if (canGoBack.value) {
      await onGoBack(webController);
    } else {
      await webController.loadUrl(Uri.parse('https://www.google.com/').toString());
    }
  }

  Future<void> onUrlEditingComplete(WebViewController webController, String urlTextFromField) async {
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
    await onLoadUrl(webController, loadedUrl);
  }

  Future<void> onClearCache(WebViewController webController) async {
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

  Future<void> onWebError(WebViewController webController, WebResourceError error, String urlTextFromField) async {
    if (error.errorCode == -2) {
      final searchString = urlTextFromField.replaceAll(' ', '+');
      await onLoadUrl(webController, 'https://www.google.com/search?q=$searchString');
    }
  }

  String onPageStarted(String url) {
    loadingPercentage.value = 0;
    fullUrl = url;
    final listSplitUrl = url.split('/');
    shortUrl = listSplitUrl[2];
    if (shortUrl.substring(0, 4) == 'www.') {
      shortUrl = shortUrl.substring(4);
    }
    // urlTextController.text = shortUrl;
    return shortUrl;
  }

  Future<void> onPageFinished(WebViewController webController, String url) async {
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
