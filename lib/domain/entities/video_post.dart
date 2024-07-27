class VideoPost {
  final String videoDescription;
  final String videoUrl;
  final int likes;
  final int views;

  VideoPost({
    required this.videoDescription,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0
  });
}