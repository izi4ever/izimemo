import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../custom/custom_constants.dart';
import '../home_page/dictionary_widget/dictionary_widget.dart';
import '../home_page/home_page_controller.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({
    super.key,
    required this.filePath,
  });

  final String filePath;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  int? bufferDelay;

  final HomePageController homePageController = Get.put(HomePageController());

  GlobalKey ratioContainer = GlobalKey();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));

    await Future.wait([
      _videoPlayerController.initialize(),
    ]);

    _createChewieController();
    
    _videoPlayerController.setVolume(homePageController.backgroundVolume.value); 
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      progressIndicatorDelay: bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
      hideControlsTimer: const Duration(seconds: 5),
      allowFullScreen: false,
      // aspectRatio: _videoPlayerController.value.aspectRatio,
      // aspectRatio: 2.35,
      // aspectRatio: ratioContainer.currentContext!.size!.width / ratioContainer.currentContext!.size!.height,
      zoomAndPan: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Video Player Widget')),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: DictionaryWidget(),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            // If keyboard is/not active
            bottom: (MediaQuery.of(context).viewInsets.bottom == 0)
                ? (MediaQuery.of(context).orientation == Orientation.portrait)
                    ? CustomConstants.lessonHeightPortrait
                    : CustomConstants.lessonHeightLandscape
                : 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                // If keyboard is/not active
                bottomLeft: (MediaQuery.of(context).viewInsets.bottom == 0)
                    ? const Radius.circular(CustomConstants.webviewRadius)
                    : const Radius.circular(0),
                bottomRight: (MediaQuery.of(context).viewInsets.bottom == 0)
                    ? const Radius.circular(CustomConstants.webviewRadius)
                    : const Radius.circular(0),
              ),
              child: Container(
                key: ratioContainer,
                color: Colors.black,
                child: _chewieController != null && _chewieController!.videoPlayerController.value.isInitialized
                    ? Chewie(
                        controller: _chewieController!,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                        ],
                      ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              onPressed: Get.back,
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
