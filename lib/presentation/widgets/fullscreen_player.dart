import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullscreenPlayer extends StatefulWidget{
  final String videoUrl;
  final String videoDescription;

  const FullscreenPlayer({
    required this.videoUrl,
    required this.videoDescription,
    super.key
  });

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset( widget.videoUrl )
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2,),
          );
        }
        return GestureDetector(
          onTap: () => (controller.value.isPlaying) ? controller.pause() : controller.play(),
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(children: [
              VideoPlayer(controller),
              // Gradiante
              Positioned(
                bottom: 30,
                left: 30,
                child: _VideoDescription(description: widget.videoDescription)
              )
            ],),
          ),
        );
      },
    );
  }
}

class _VideoDescription extends StatelessWidget {
  final String description;
  const _VideoDescription({
    required this.description,
  });

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .7,
      child: Text(
        description,
        maxLines: 2,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}