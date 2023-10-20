base class DownloadTask {
  final String id;
  final String url;
  final String fileExtension;

  /// The path of the file inside temp directory
  final String savePath;

  const DownloadTask({
    required this.id,
    required this.url,
    required this.fileExtension,
    required this.savePath,
  });
}
