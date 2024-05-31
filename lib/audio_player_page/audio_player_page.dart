import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:izimemo/audio_player_page/audio_player_controller.dart';
import 'package:izimemo/custom/widgets/custom_scaffold_with_study.dart';

import '../custom/colors/custom_design_colors.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final AudioPlayerController audioPlayerController = Get.put(AudioPlayerController());

  @override
  void initState() {
    super.initState();

    audioPlayerController.listenPlayPause();
    audioPlayerController.listenDuration();
    audioPlayerController.listenPosition();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithStudy(
      padding: const EdgeInsets.all(0),
      appBarTitle: 'audio_player'.tr,
      appBarTitleColor: Colors.white,
      appBarColor: CustomDesignColors.darkBlue,
      child: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: audioPlayerController.listAudioFiles.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: (index == audioPlayerController.currentTrackIndex.value)
                        ? const Color.fromARGB(255, 223, 239, 245)
                        : ((index % 2) == 0)
                            ? Colors.white
                            : Colors.grey[50],
                    child: ListTile(
                      minLeadingWidth: 0,
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          (index == audioPlayerController.currentTrackIndex.value)
                              ? Icon(audioPlayerController.isPlaying.value
                                  ? Icons.play_arrow_rounded
                                  : Icons.pause_circle_rounded)
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
                        audioPlayerController.listAudioFiles[index].path.split('/').last,
                        style: TextStyle(
                          color: (index == audioPlayerController.currentTrackIndex.value)
                              ? CustomDesignColors.darkBlue
                              : Colors.blueGrey[900],
                          fontWeight:
                              (index == audioPlayerController.currentTrackIndex.value) ? FontWeight.w900 : FontWeight.w500,
                          fontSize: (index == audioPlayerController.currentTrackIndex.value) ? 18 : 16,
                        ),
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                      selected: audioPlayerController.currentTrackIndex.value == index,
                      onTap: () => audioPlayerController.onItemTap(index),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.close,
                          size: 14,
                          color: (index == audioPlayerController.currentTrackIndex.value)
                              ? CustomDesignColors.darkBlue
                              : Colors.grey[500],
                        ),
                        onPressed: () => audioPlayerController.deleteItem(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: CustomDesignColors.menuBlue,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 20),
                child: Column(
                  children: [
                    Slider(
                      min: 0,
                      max: audioPlayerController.durationSecond.value,
                      value: audioPlayerController.positionSecond.value,
                      onChanged: (value) async => audioPlayerController.onChangedPosition(value),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(audioPlayerController.positionString.value),
                        Text(audioPlayerController.durationString.value),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: audioPlayerController.addFiles,
                          icon: const Icon(
                            Icons.create_new_folder_rounded,
                            color: CustomDesignColors.darkBlue,
                          ),
                        ),
                        IconButton(
                          onPressed: audioPlayerController.listAudioFiles.isNotEmpty
                              ? audioPlayerController.playPreviousAudio
                              : () {},
                          icon: Icon(
                            size: 22,
                            FontAwesomeIcons.backward,
                            color: audioPlayerController.listAudioFiles.isNotEmpty
                                ? CustomDesignColors.darkBlue
                                : CustomDesignColors.darkBlueInactive,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: audioPlayerController.listAudioFiles.isNotEmpty
                              ? audioPlayerController.onPlayPause
                              : () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(14),
                            backgroundColor: audioPlayerController.listAudioFiles.isNotEmpty
                                ? CustomDesignColors.darkBlue
                                : CustomDesignColors.darkBlueInactive,
                            foregroundColor: audioPlayerController.listAudioFiles.isNotEmpty
                                ? Colors.white
                                : CustomDesignColors.menuBlue,
                            elevation: 0,
                          ),
                          child: Icon(
                            audioPlayerController.isPlaying.value ? Icons.pause_rounded : Icons.play_arrow_rounded,
                          ),
                        ),
                        IconButton(
                          onPressed: audioPlayerController.listAudioFiles.isNotEmpty
                              ? audioPlayerController.playNextAudio
                              : () {},
                          icon: Icon(
                            size: 22,
                            FontAwesomeIcons.forward,
                            color: audioPlayerController.listAudioFiles.isNotEmpty
                                ? CustomDesignColors.darkBlue
                                : CustomDesignColors.darkBlueInactive,
                          ),
                        ),
                        IconButton(
                          onPressed:
                              audioPlayerController.listAudioFiles.isNotEmpty ? audioPlayerController.stopAudio : () {},
                          icon: Icon(
                            Icons.stop_rounded,
                            color: audioPlayerController.listAudioFiles.isNotEmpty
                                ? CustomDesignColors.darkBlue
                                : CustomDesignColors.darkBlueInactive,
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
      ),
    );
  }

  @override
  void dispose() {
    audioPlayerController.onDispose();
    super.dispose();
  }
}
