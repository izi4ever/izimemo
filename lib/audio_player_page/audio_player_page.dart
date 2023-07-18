import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izimemo/audio_player_page/audio_player_controller.dart';
import 'package:izimemo/custom/widgets/custom_scaffold_with_study.dart';

class AudioPlayerPage extends StatefulWidget {
  AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final AudioPlayerController audioPlayerController = Get.put(AudioPlayerController());

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithStudy(
      appBarTitle: 'audio_player'.tr,
      child: Text('audio_player'.tr),
    );
  }

  @override
  void dispose() {
    audioPlayerController.onDispose();
    super.dispose();
  }
}
