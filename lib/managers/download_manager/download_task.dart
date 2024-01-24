base class DownloadTask {
  final String userId;
  final String trackId;
  final String url;

  const DownloadTask({
    required this.userId,
    required this.trackId,
    required this.url,
  });

  String get taskId => '${userId}_$trackId';
}
