import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:izimemo/home_page/dictionary_widget/dictionary_controller.dart';
import 'package:wakelock/wakelock.dart';

import '../instruction_page/instruction_controller.dart';

class LifecycleWidgetWrapper extends StatefulWidget {
  final Widget child;

  const LifecycleWidgetWrapper({
    super.key,
    required this.child,
  });

  @override
  State<LifecycleWidgetWrapper> createState() => _LifecycleWidgetWrapperState();
}

class _LifecycleWidgetWrapperState extends State<LifecycleWidgetWrapper> with WidgetsBindingObserver {
  AppLifecycleState _appLifecycleState = AppLifecycleState.resumed;
  Timer? _timer;
  DictionaryController dictionaryController = Get.put(DictionaryController());
  final InstructionController instructionController = Get.put(InstructionController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initialization();

    dictionaryController.initFlutterTts();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    super.dispose();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    setState(() {
      _appLifecycleState = state;
      // print('>>> $_appLifecycleState');
    });

    if (dictionaryController.autoPlay.isTrue && instructionController.getReadInstructionIsShown) {
      if (_appLifecycleState == AppLifecycleState.paused) {
        _timer = Timer.periodic(Duration(seconds: dictionaryController.secondsPerEntries.value.round()), (timer) {
          Wakelock.enable();
          dictionaryController.backgroundSpeechOnce();
        });
      } else if (_appLifecycleState == AppLifecycleState.detached) {
        Wakelock.enable();
      } else if (_appLifecycleState == AppLifecycleState.resumed) {
        Wakelock.disable();
        _timer?.cancel();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
