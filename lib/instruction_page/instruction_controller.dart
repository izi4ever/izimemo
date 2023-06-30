import 'package:get/get.dart';

import '../app_storage/app_settings_storage.dart';

class InstructionController extends GetxController {
  final AppSettingsStorage appSettingsStorage = AppSettingsStorage();

  bool get getReadInstructionIsShown => appSettingsStorage.readInstructionIsShown;

  void saveClosingInstruction() {
    appSettingsStorage.writeInstructionIsShown(true);
  }
}
