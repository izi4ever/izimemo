import 'dart:io';

import 'package:get/get.dart';
import 'package:izimemo/custom/custom_constants.dart';
import 'package:izimemo/update_page/update_model.dart';
import 'package:izimemo/update_page/update_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateController extends GetxController {
  UpdateModel? updateModel = UpdateModel();
  UpdateRepository updateRepository = UpdateRepository();

  String comment = '';
  String buttonText = '';
  String marketLink = '';

  Future<bool> isOldVersion() async {
    updateModel = await updateRepository.checkRepository();
    String? appLastVersion = updateModel?.appLastVersion;
    if (appLastVersion != null) {
      List<String> splitAppVersion = appLastVersion.split('.');
      List<String> splitThisAppVersion = CustomConstants.thisAppBuildVersion.split('.');
      int majorAppLastVersion = int.parse(splitAppVersion[0]);
      int majorThisAppVersion = int.parse(splitThisAppVersion[0]);

      if (majorAppLastVersion > majorThisAppVersion) {
        String currentLanguage = 'current_language'.tr;

        switch (currentLanguage) {
          case 'en':
            comment = updateModel?.lang?.en?.comment ?? '';
            buttonText = updateModel?.lang?.en?.buttonText ?? '';
            break;
          case 'ru':
            comment = updateModel?.lang?.ru?.comment ?? '';
            buttonText = updateModel?.lang?.ru?.buttonText ?? '';
            break;
          case 'uk':
            comment = updateModel?.lang?.uk?.comment ?? '';
            buttonText = updateModel?.lang?.uk?.buttonText ?? '';
            break;
          case 'de':
            comment = updateModel?.lang?.de?.comment ?? '';
            buttonText = updateModel?.lang?.de?.buttonText ?? '';
            break;
        }

        if (Platform.isAndroid) {
          marketLink = updateModel?.link?.android ?? '';
        } else if (Platform.isIOS) {
          marketLink = updateModel?.link?.ios ?? '';
        }

        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  void launchStoreLink() async {
    if (await canLaunchUrl(Uri.parse(marketLink))) {
      await launchUrl(Uri.parse(marketLink));
    } else {
      // Handle error: If the link couldn't be opened, display an error message or perform a fallback action.
      throw 'Could not launch $marketLink';
    }
  }


}
