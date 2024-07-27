import 'package:toktik/domain/entities/video_post.dart';
import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/fullscreen_player.dart';
import 'package:toktik/presentation/widgets/video_buttons_widget.dart';

class VideoScrollableWidget extends StatelessWidget{
  const VideoScrollableWidget({
    super.key,
    required this.videos
  });

  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context){
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost dataVideo = videos[index];
        return Stack(
          children: [
            SizedBox.expand(
              child: FullscreenPlayer(
                videoUrl: dataVideo.videoUrl,
                videoDescription: dataVideo.videoDescription,
              ),
            ),
            // Bottons
            Positioned(
              bottom: 30,
              right: 18,
              child: VideoButtonsWidget(video: dataVideo,)
            )
          ],
        );
      },
    );
  }
}