import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtonsWidget extends StatelessWidget {
  const VideoButtonsWidget({
    super.key,
    required this.video,
  });
  final VideoPost video;

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        _ButtonIconVideo(
          value: '${video.likes}',
          icon: Icons.favorite,
          color: Colors.white,
          onPressedAction: () {
          },
        ),
        _ButtonIconVideo(
          value: '${video.views}',
          icon: Icons.remove_red_eye,
          color: Colors.white,
          onPressedAction: () {
          },
        )
      ],
    );
  }
}

class _ButtonIconVideo extends StatelessWidget {
  const _ButtonIconVideo({
    required this.value,
    required this.icon,
    required this.color,
    required this.onPressedAction
  });

  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback? onPressedAction;

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        IconButton(
          onPressed: onPressedAction ,
          icon: Icon(icon, color: color,)
        ),
        Text(value)
      ],
    );
  }
}