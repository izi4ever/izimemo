import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:izimemo/instruction_page/instruction_controller.dart';
import 'package:izimemo/instruction_page/instruction_page.dart';
import 'package:izimemo/update_page/update_controller.dart';
import 'package:izimemo/update_page/update_page.dart';

import 'custom/colors/custom_design_colors.dart';
import 'custom/translations.dart';
import 'home_page/home_page.dart';
import 'home_page/lifecycle_widget_wrapper.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await GetStorage.init();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.black,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final InstructionController instructionController = Get.put(InstructionController());
  final UpdateController updateController = Get.put(UpdateController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'izimemo',
      home: LifecycleWidgetWrapper(
        child: FutureBuilder<bool>(
            future: updateController.isOldVersion(),
            builder: (context, snapshot) {
              // Show UpdatePage when isOldVersion is true
              if (snapshot.connectionState == ConnectionState.done) {
                final bool isOldVersion = snapshot.data ?? false;
                if (isOldVersion) {
                  Future.delayed(const Duration(minutes: 10), () => Get.to(() => const UpdatePage()));
                }
              }

              // Show HomePage directly in any case
              return instructionController.getReadInstructionIsShown ? const HomePage() : InstructionPage();
            }),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: CustomDesignColors.darkBlue,
          secondary: CustomDesignColors.lightBlue,
        ),
        sliderTheme: const SliderThemeData(
          inactiveTrackColor: CustomDesignColors.lightBlue,
        ),
        // switchTheme: SwitchThemeData(),
      ),
    );
  }
}
