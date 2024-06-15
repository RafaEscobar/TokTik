import 'package:toktik/domain/entities/video_post.dart';

class VideoPostModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  VideoPostModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0
  });

  factory VideoPostModel.fromJson(Map<String, dynamic> json) => VideoPostModel(
    name: json['name'],
    videoUrl: json['videoUrl'],
    likes: json['likes'],
    views: json['views'],
  );

  VideoPost toVideoPostEntity() => VideoPost(
    videoDescription: name,
    videoUrl: videoUrl,
    likes: likes,
    views: views
  );
}