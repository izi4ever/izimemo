import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class AudioPlayerController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  final List<FileSystemEntity> listAudioFiles = [];
  int currentTrackIndex = -1;
  bool isPlaying = false;

  AudioPlayerController() {
    pickAudioFiles();
  }

  Future<void> onDispose() async {
    await audioPlayer.dispose();
  }

  Future<void> pickAudioFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: true,
    );

    if (result != null) {
      List<FileSystemEntity> pickedFiles = result.paths.map((path) => File(path!)).toList();

      listAudioFiles.addAll(pickedFiles);

      currentTrackIndex = 0;
      playAudio(currentTrackIndex);

      print('>>> listAudioFiles: $listAudioFiles');
    }
  }

  Future<void> playAudio(int index) async {
    if (index >= 0 && index < listAudioFiles.length) {
      currentTrackIndex = index;
      isPlaying = true;

      String filePath = listAudioFiles[index].path;
      await audioPlayer.play(DeviceFileSource(filePath));

      print('>>> filePath: $filePath');
    }
  }
}
