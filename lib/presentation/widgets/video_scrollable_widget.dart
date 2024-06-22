import 'package:toktik/domain/entities/video_post.dart';
import 'package:flutter/material.dart';

class VideoScrollableWidget extends StatelessWidget{
  const VideoScrollableWidget({
    super.key,
    required this.videos
  });

  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context){
    return PageView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      children: [
        Container(color: Colors.blue,),
        Container(color: Colors.red,)
      ],
    );
  }
}