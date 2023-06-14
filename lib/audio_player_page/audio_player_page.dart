import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:izimemo/custom/colors/custom_design_colors.dart';

import '../custom/widgets/scaffold_with_study.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<FileSystemEntity> _audioFiles = [];
  int _currentTrackIndex = -1;
  bool _isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    _pickAudioFiles();

    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      print('>>> player state: $state');

      if (state == PlayerState.playing) {
        setState(() {
          _isPlaying = true;
        });
      } else {
        setState(() {
          _isPlaying = false;
        });
      }

      if (state == PlayerState.completed) {
        _currentTrackIndex++;
        if (_currentTrackIndex >= _audioFiles.length) {
          _currentTrackIndex = 0;
        }
        _playAudio(_currentTrackIndex);
      }
    });

    _audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _pickAudioFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: true,
    );

    if (result != null) {
      List<FileSystemEntity> pickedFiles = result.paths.map((path) => File(path!)).toList();
      setState(() {
        _audioFiles.addAll(pickedFiles);
      });
      _currentTrackIndex = 0;
      _playAudio(_currentTrackIndex);
    }
  }

  Future<void> _playAudio(int index) async {
    if (index >= 0 && index < _audioFiles.length) {
      setState(() {
        _currentTrackIndex = index;
        _isPlaying = true;
      });

      String filePath = _audioFiles[index].path;
      await _audioPlayer.play(DeviceFileSource(filePath));
    }
  }

  Future<void> _pauseAudio() async {
    await _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  Future<void> _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
    });
  }

  Future<void> _playPreviousAudio() async {
    _currentTrackIndex--;
    if (_currentTrackIndex < 0) {
      _currentTrackIndex = _audioFiles.length - 1;
    }
    await _stopAudio();
    await _playAudio(_currentTrackIndex);
  }

  Future<void> _playNextAudio() async {
    _currentTrackIndex++;
    if (_currentTrackIndex >= _audioFiles.length) {
      _currentTrackIndex = 0;
    }
    await _stopAudio();
    await _playAudio(_currentTrackIndex);
  }

  Future<void> _deleteAudioFile(FileSystemEntity audioFile) async {
    await _stopAudio();
    setState(() {
      _audioFiles.remove(audioFile);
      _currentTrackIndex = -1;
    });
  }

  // String formatTime(Duration d) => d.toString().split('.').first.padLeft(8, "0");
  String formatTime(Duration d) {
    var v1 = d.toString().split('.').first.padLeft(8, "0").split(':');
    if (v1[0] == '00') {
      v1.removeAt(0);
    }
    var v2 = v1.join(':');
    return v2;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithStudy(
      padding: const EdgeInsets.all(0),
      appBarTitle: 'audio_player'.tr,
      // appBarTitleColor: CustomDesignColors.lightBlue,
      appBarTitleColor: Colors.white,
      appBarColor: CustomDesignColors.darkBlue,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _audioFiles.length,
              itemBuilder: (context, index) {
                return Container(
                  color: (index == _currentTrackIndex)
                      ? Color.fromARGB(255, 223, 239, 245)
                      : ((index % 2) == 0)
                          ? Colors.white
                          : Colors.grey[50],
                  child: ListTile(
                    minLeadingWidth: 0,
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        (index == _currentTrackIndex)
                            ? const Icon(Icons.play_arrow_rounded)
                            : Text(
                                '${index + 1}.',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 12,
                                ),
                              ),
                      ],
                    ),
                    title: Text(
                      _audioFiles[index].path.split('/').last,
                      style: TextStyle(
                        color: (index == _currentTrackIndex) ? CustomDesignColors.darkBlue : Colors.blueGrey[900],
                        fontWeight: (index == _currentTrackIndex) ? FontWeight.w900 : FontWeight.w500,
                        fontSize: (index == _currentTrackIndex) ? 18 : 16,
                      ),
                      // overflow: TextOverflow.ellipsis,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                    ),
                    selected: _currentTrackIndex == index,
                    onTap: () async {
                      await _stopAudio();
                      await _playAudio(index);
                      setState(() {
                        _currentTrackIndex = index;
                      });
                    },
                    trailing: IconButton(
                      // icon: Icon(Icons.delete_sweep_rounded),
                      icon: Icon(
                        Icons.close,
                        size: 14,
                        color: (index == _currentTrackIndex) ? CustomDesignColors.darkBlue : Colors.grey[500],
                      ),
                      onPressed: () {
                        setState(() {
                          _audioFiles.removeAt(index);
                          if (_audioFiles.isEmpty) {
                            _stopAudio();
                          } else if (index == _currentTrackIndex) {
                            if (_currentTrackIndex == _audioFiles.length) {
                              _playAudio(0);
                              _currentTrackIndex = 0;
                            } else {
                              _playAudio(_currentTrackIndex);
                            }
                          } else if (index < _currentTrackIndex) {
                            _currentTrackIndex--;
                          }
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            // color: CustomDesignColors.lightBlue,
            // color: CustomDesignColors.mediumBlue,
            color: CustomDesignColors.menuBlue,
            child: Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 20),
              child: Column(
                children: [
                  Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await _audioPlayer.seek(position);

                      await _audioPlayer.resume();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position)),
                      Text(formatTime(duration)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await _stopAudio();
                          await _pickAudioFiles();
                        },
                        icon: const Icon(
                          Icons.create_new_folder_rounded,
                          color: CustomDesignColors.darkBlue,
                        ),
                      ),
                      if (_audioFiles.isNotEmpty)
                        IconButton(
                          onPressed: _playPreviousAudio,
                          icon: Icon(
                            // Icons.skip_previous_rounded,
                            // size: 28,
                            size: 22,
                            FontAwesomeIcons.backward,
                            color: CustomDesignColors.darkBlue,
                          ),
                        ),
                      if (_audioFiles.isNotEmpty)
                        ElevatedButton(
                          onPressed: () => _isPlaying ? _pauseAudio() : _playAudio(_currentTrackIndex),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(), //<-- SEE HERE
                            // padding: const EdgeInsets.all(12),
                            padding: const EdgeInsets.all(14),
                          ),
                          child: Icon(
                            _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                            // size: 32,
                          ),
                        ),
                      // IconButton(
                      //   onPressed: () => _isPlaying ? _pauseAudio() : _playAudio(_currentTrackIndex),
                      //   icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                      // ),
                      if (_audioFiles.isNotEmpty)
                        IconButton(
                          onPressed: _playNextAudio,
                          icon: Icon(
                            // Icons.skip_next_rounded,
                            // size: 28,
                            size: 22,
                            FontAwesomeIcons.forward,
                            color: CustomDesignColors.darkBlue,
                          ),
                        ),
                      if (_audioFiles.isNotEmpty)
                        IconButton(
                          onPressed: _stopAudio,
                          icon: Icon(
                            Icons.stop_rounded,
                            color: CustomDesignColors.darkBlue,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
