import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../custom/dialogs.dart';

class HomePageController extends GetxController {
  WebViewController webController;
  HomePageController(this.webController);

  var canGoBack = false;
  var canGoForward = false;


  Dialogs dialogs = Dialogs();
  
  Future<bool> onGoBack() async {
    if (canGoBack) {
      await webController.goBack();
    } else {
      dialogs.showSnackBar('Backward history is empty');
    }
    return false;
  }



}
