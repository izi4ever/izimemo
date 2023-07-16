import 'package:get/get.dart';
import 'package:izimemo/custom/custom_constants.dart';
import 'package:izimemo/update_page/update_model.dart';
import 'package:izimemo/update_page/update_repository.dart';

class UpdateController extends GetxController {
  UpdateModel? updateModel = UpdateModel();
  UpdateRepository updateRepository = UpdateRepository();

  Future<bool> isOldVersion() async {
    updateModel = await updateRepository.checkRepository();
    String? appLastVersion = updateModel?.appLastVersion;
    if (appLastVersion != null) {
      List<String> splitAppVersion = appLastVersion.split(appLastVersion);
      int majorAppLastVersion = int.parse(splitAppVersion[0]);
      int majorThisAppVersion = int.parse(CustomConstants.thisAppBuildVersion);

      if (majorAppLastVersion > majorThisAppVersion) {
        return true;
      } else {
        return false;
      }
      
    } else {
      return false;
    }
  }
}
