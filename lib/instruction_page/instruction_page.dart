import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:izimemo/custom/colors/custom_design_colors.dart';
import 'package:izimemo/home_page/home_page.dart';
import 'package:izimemo/instruction_page/instruction_controller.dart';

class InstructionPage extends StatelessWidget {
  InstructionPage({super.key});

  final introKey = GlobalKey<IntroductionScreenState>();

  final InstructionController instructionController = Get.put(InstructionController());

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: CustomDesignColors.mediumBlue,
      nextFlex: 0,
      skipOrBackFlex: 0,
      dotsFlex: 0,
      pages: [
        PageViewModel(
          title: 'page_1_title'.tr,
          body: 'page_1_body'.tr,
          image: Image.asset("assets/instruction/page_1_3.png", height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: 'page_2_title'.tr,
          body: 'page_2_body'.tr,
          image: Image.asset('assets/instruction/page_2_3.png', height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: 'page_3_title'.tr,
          body: 'page_3_body'.tr,
          image: Image.asset('assets/instruction/page_3_3.png', height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: 'page_4_title'.tr,
          body: 'page_4_body'.tr,
          image: Image.asset('assets/instruction/page_4_2.png', height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: 'page_5_title'.tr,
          body: 'page_5_body'.tr,
          image: Image.asset('assets/instruction/page_5_2.png', height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: 'page_6_title'.tr,
          body: 'page_6_body'.tr,
          image: Image.asset('assets/instruction/page_6_1.png', height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: 'page_7_title'.tr,
          body: 'page_7_body'.tr,
          image: Image.asset('assets/instruction/page_7_1.png', height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: 'page_8_title'.tr,
          body: 'page_8_body'.tr,
          image: Image.asset('assets/instruction/page_8_1.png', height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
      ],
      onDone: () {
        // Action to perform after the last page is shown (e.g., go to the home screen)
        // You can navigate to a new screen or set a flag to indicate the user has seen the introduction
        instructionController.dontShowInstruction();
        Get.to(() => const HomePage());
      },
      onSkip: () {
        // Action to perform when the user taps on the Skip button
        // You can navigate to a new screen or set a flag to indicate the user has skipped the introduction
        instructionController.readLaterInstruction();
        Get.to(() => const HomePage());
      },
      showSkipButton: true,
      skip: Text('skip'.tr),
      next: const Icon(Icons.arrow_forward),
      done: Text('done'.tr, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
