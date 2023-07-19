import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../home_page/home_page_controller.dart';

class AudioPlayerController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  var listAudioFiles = [].obs;
  var currentTrackIndex = -1.obs;
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
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.playing) {
        isPlaying.value = true;
      } else {
        isPlaying.value = false;
      }

      if (state == PlayerState.completed) {
        currentTrackIndex++;
        if (currentTrackIndex >= listAudioFiles.length) {
          currentTrackIndex = 0;
        }
        playAudio(currentTrackIndex);
      }
    });
  }

  void listenDuration() {
    audioPlayer.onDurationChanged.listen((newDuration) {
      duration = newDuration;
      durationSecond.value = duration.inSeconds.toDouble();
      durationString.value = formatTime(duration);
    });
  }

  void listenPosition() {
    audioPlayer.onPositionChanged.listen((newPosition) {
      position = newPosition;
      positionSecond.value = position.inSeconds.toDouble();
      positionString.value = formatTime(position);
    });
  }

  Future<void> onChangedPosition(double value) async {
    final position = Duration(seconds: value.toInt());
    await audioPlayer.seek(position);
    await audioPlayer.resume();
  }

  void onItemTap(int index) {
    currentTrackIndex = index;
    playAudio(currentTrackIndex);
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

      currentTrackIndex = listAudioFiles.length;
      listAudioFiles.addAll(pickedFiles);

      await audioPlayer.setVolume(homePageController.backgroundVolume.value);

      playAudio(currentTrackIndex);
    }
  }

  Future<void> addFiles() async {
    await stopAudio();
    await pickAudioFiles();
  }

  void onPlayPause() => isPlaying.value ? pauseAudio() : playAudio(currentTrackIndex);

  Future<void> playAudio(int index) async {
    await audioPlayer.stop();

    if (index >= 0 && index < listAudioFiles.length) {
      currentTrackIndex = index;
      isPlaying.value = true;

      String filePath = listAudioFiles[index].path;
      await audioPlayer.play(DeviceFileSource(filePath));
    }
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
    isPlaying.value = false;
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
    isPlaying.value = false;
  }

  Future<void> playPreviousAudio() async {
    currentTrackIndex--;
    if (currentTrackIndex < 0) {
      currentTrackIndex = listAudioFiles.length - 1;
    }
    await stopAudio();
    playAudio(currentTrackIndex);
  }

  void playNextAudio() {
    currentTrackIndex++;
    if (currentTrackIndex >= listAudioFiles.length) {
      currentTrackIndex = 0;
    }
    playAudio(currentTrackIndex);
  }

  Future<void> deleteItem(int index) async {
    await stopAudio();
    listAudioFiles.removeAt(index);
    if (listAudioFiles.isEmpty) {
      await stopAudio();
      durationString.value = '00:00';
      positionString.value = '00:00';
      positionSecond.value = 0;
    } else if (index == currentTrackIndex) {
      if (currentTrackIndex == listAudioFiles.length) {
        playAudio(0);
        currentTrackIndex = 0;
      } else {
        playAudio(currentTrackIndex);
      }
    } else if (index < currentTrackIndex) {
      currentTrackIndex--;
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
