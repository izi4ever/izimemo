import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_storage/app_settings_storage.dart';
import '../custom/dialogs.dart';

class HomePageController extends GetxController {
  var canGoBack = false.obs;
  var canGoForward = false.obs;

  var loadingPercentage = 0.obs;

  var fullUrl = ''.obs;
  late String shortUrl;

  Dialogs dialogs = Dialogs();
  final AppSettingsStorage appSettingsStorage = AppSettingsStorage();

  double get getBackgroundVolume => appSettingsStorage.readBackgroundVolume;
  late RxDouble backgroundVolume;

  HomePageController() {
    backgroundVolume = getBackgroundVolume.obs;
  }

  Future<bool> onGoBack(WebViewController webController) async {
    if (canGoBack.value) {
      await webController.goBack();
    } else {
      dialogs.showSnackBar('backward_empty'.tr);
    }
    return false;
  }

  Future<RxBool> onGoForward(WebViewController webController) async {
    if (canGoForward.value) {
      await webController.goForward();
    } else {
      dialogs.showSnackBar('forward_empty'.tr);
    }
    return canGoForward;
  }

  Future<void> onReload(WebViewController webController) async {
    await webController.reload();
  }

  Future<void> onLoadUrl(WebViewController webController, String url) async {
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

  Future<void> onWebError(WebViewController webController, WebResourceError error, String urlTextFromField) async {
    if (error.errorCode == -2) {
      final searchString = urlTextFromField.replaceAll(' ', '+');
      await onLoadUrl(webController, 'https://www.google.com/search?q=$searchString');
    }
  }

  String onPageStarted(String url) {
    loadingPercentage.value = 0;
    fullUrl.value = url;
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

  Future<void> setVolume(WebViewController webController) async {
    await webController.runJavaScript('''
      var videos = document.getElementsByTagName('video');
      for (var i = 0; i < videos.length; i++) {
        videos[i].volume = ${backgroundVolume.value};
      }

      var audios = document.getElementsByTagName('audio');
      for (var i = 0; i < audios.length; i++) {
        audios[i].volume = ${backgroundVolume.value};
      }

      var iframe = document.querySelector('iframe');
      if (iframe) {
        var player = iframe.contentWindow.document.querySelector('video');
        if (player) {
          player.volume = ${backgroundVolume.value};
        }
      }
    ''');
  }
}
