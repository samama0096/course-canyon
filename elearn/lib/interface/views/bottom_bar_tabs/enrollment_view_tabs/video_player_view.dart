import 'package:cached_video_player/cached_video_player.dart';
import 'package:elearn/data/models/section_model.dart.dart';
import 'package:flutter/material.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key, required this.lesson});
  final Lesson lesson;
  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late CachedVideoPlayerController controller;
  @override
  void initState() {
    controller = CachedVideoPlayerController.network((widget.lesson.link),
        videoPlayerOptions: VideoPlayerOptions());
    controller.initialize().then((value) {
      controller.play();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: CachedVideoPlayer(controller))
              : const CircularProgressIndicator()),
    );
  }
}
