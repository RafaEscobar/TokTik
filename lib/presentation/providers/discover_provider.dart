import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/models/video_post_model.dart';
import 'package:toktik/shared/data/local_videos.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    List<VideoPost> newVideos = videoPosts.map(
      (video) => VideoPostModel.fromJson(video).toVideoPostEntity()
    ).toList();
    videos.addAll(newVideos);
  initialLoading = false;
    notifyListeners();
  }

}