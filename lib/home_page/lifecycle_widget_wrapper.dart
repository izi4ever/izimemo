import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izimemo/home_page/dictionary_widget/dictionary_controller.dart';
import 'package:wakelock/wakelock.dart';

class LifecycleWidgetWrapper extends StatefulWidget {
  final Widget child;

  const LifecycleWidgetWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<LifecycleWidgetWrapper> createState() => _LifecycleWidgetWrapperState();
}

class _LifecycleWidgetWrapperState extends State<LifecycleWidgetWrapper> with WidgetsBindingObserver {
  AppLifecycleState _appLifecycleState = AppLifecycleState.resumed;
  Timer? _timer;
  DictionaryController dictionaryController = Get.put(DictionaryController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    setState(() {
      _appLifecycleState = state;
      print('>>> $_appLifecycleState');
    });

    if (dictionaryController.autoPlay.isTrue) {
      if (_appLifecycleState == AppLifecycleState.paused) {
        _timer = Timer.periodic(Duration(seconds: dictionaryController.secondsPerEntries.value.round()), (timer) {
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