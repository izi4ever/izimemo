import 'package:flutter/material.dart';

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
    setState(() {
      _appLifecycleState = state;
      print('>>> _appLifecycleState: $_appLifecycleState');
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

}
