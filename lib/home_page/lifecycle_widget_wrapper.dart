import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izimemo/home_page/dictionary_widget/dictionary_controller.dart';

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
  late AppLifecycleState _appLifecycleState;
  DictionaryController dictionaryController = Get.put(DictionaryController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      dictionaryController.appIsPaused.value = true;
    } else {
      dictionaryController.appIsPaused.value = false;
    }
    // setState(() async {
    //   _appLifecycleState = state;
    //   if (_appLifecycleState == AppLifecycleState.paused) {
    //     dictionaryController.backgroundSpeech();
    //   }
    //   print('>>> _appLifecycleState: $_appLifecycleState');
    // while (_appLifecycleState == AppLifecycleState.paused) {
    //   await dictionaryController.backgroundSpeech();
    // }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
