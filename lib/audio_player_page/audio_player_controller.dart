import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../home_page/home_page_controller.dart';

class AudioPlayerController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  var listAudioFiles = <File>[].obs;
  var currentTrackIndex = (-1).obs;
  var isPlaying = false.obs;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  var durationSecond = 0.0.obs;
  var positionSecond = 0.0.obs;
  var durationString = '00:00'.obs;
  var positionString = '00:00'.obs;

  final HomePageController homePageController = Get.put(HomePageController());

  AudioPlayerController() {
    pickAudioFiles();
  }

  void listenPlayPause() {
    audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      this.isPlaying.value = isPlaying;

      final processingState = playerState.processingState;
      if (processingState == ProcessingState.completed) {
        currentTrackIndex.value++;
        if (currentTrackIndex.value >= listAudioFiles.length) {
          currentTrackIndex.value = 0;
        }
        playAudio(currentTrackIndex.value);
      }
    });
  }

  void listenDuration() {
    audioPlayer.durationStream.listen((newDuration) {
      if (newDuration != null) {
        duration = newDuration;
        durationSecond.value = duration.inSeconds.toDouble();
        durationString.value = formatTime(duration);
      }
    });
  }

  void listenPosition() {
    audioPlayer.positionStream.listen((newPosition) {
      position = newPosition;
      positionSecond.value = position.inSeconds.toDouble();
      positionString.value = formatTime(position);
    });
  }

  Future<void> onChangedPosition(double value) async {
    final position = Duration(seconds: value.toInt());
    await audioPlayer.seek(position);
    if (isPlaying.value) {
      await audioPlayer.play();
    }
  }

  void onItemTap(int index) {
    currentTrackIndex.value = index;
    playAudio(currentTrackIndex.value);
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
      List<File> pickedFiles = result.paths.map((path) => File(path!)).toList();

      currentTrackIndex.value = listAudioFiles.length;
      listAudioFiles.addAll(pickedFiles);

      await audioPlayer.setVolume(homePageController.backgroundVolume.value);

      playAudio(currentTrackIndex.value);
    }
  }

  Future<void> addFiles() async {
    await stopAudio();
    await pickAudioFiles();
  }

  void onPlayPause() => isPlaying.value ? pauseAudio() : resumeAudio();

  Future<void> playAudio(int index) async {
    await audioPlayer.stop();

    if (index >= 0 && index < listAudioFiles.length) {
      currentTrackIndex.value = index;
      isPlaying.value = true;

      String filePath = listAudioFiles[index].path;
      await audioPlayer.setFilePath(filePath);
      await audioPlayer.play();
    }
  }

  Future<void> resumeAudio() async {
    await audioPlayer.play();
    isPlaying.value = true;
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
    isPlaying.value = false;
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
    await audioPlayer.seek(Duration.zero);
    isPlaying.value = false;
  }

  Future<void> playPreviousAudio() async {
    currentTrackIndex.value--;
    if (currentTrackIndex.value < 0) {
      currentTrackIndex.value = listAudioFiles.length - 1;
    }
    await stopAudio();
    playAudio(currentTrackIndex.value);
  }

  void playNextAudio() {
    currentTrackIndex.value++;
    if (currentTrackIndex.value >= listAudioFiles.length) {
      currentTrackIndex.value = 0;
    }
    playAudio(currentTrackIndex.value);
  }

  Future<void> deleteItem(int index) async {
    await stopAudio();
    listAudioFiles.removeAt(index);
    if (listAudioFiles.isEmpty) {
      await stopAudio();
      durationString.value = '00:00';
      positionString.value = '00:00';
      positionSecond.value = 0;
    } else if (index == currentTrackIndex.value) {
      if (currentTrackIndex.value == listAudioFiles.length) {
        playAudio(0);
        currentTrackIndex.value = 0;
      } else {
        playAudio(currentTrackIndex.value);
      }
    } else if (index < currentTrackIndex.value) {
      currentTrackIndex.value--;
    }
  }

  String formatTime(Duration value) {
    var v1 = value.toString().split('.').first.padLeft(8, "0").split(':');
    if (v1[0] == '00') {
      v1.removeAt(0);
    }
    var v2 = v1.join(':');
    return v2;
  }
}
