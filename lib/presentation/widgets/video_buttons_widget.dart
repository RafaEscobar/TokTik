import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/helpers/number_formats.dart';

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
          value: NumberFormats.abbreviatedAmount(video.likes.toDouble()),
          iconType: Icons.favorite,
          color: Colors.red,
          onPressedAction: () {
          },
        ),
        _ButtonIconVideo(
          value: NumberFormats.abbreviatedAmount(video.views.toDouble()),
          iconType: Icons.remove_red_eye,
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
    required this.iconType,
    required this.onPressedAction,
    color,
  }) :
    iconColor = color ?? Colors.white;

  final String value;
  final IconData iconType;
  final Color iconColor;
  final VoidCallback? onPressedAction;

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        IconButton(
          onPressed: onPressedAction ,
          icon: Icon(
            iconType,
            color: iconColor,
            size: 30,
          )
        ),
        Text(value)
      ],
    );
  }
}