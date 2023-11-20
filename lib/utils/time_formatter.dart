class TimeFormatter {
  static String formatMilliseconds(int milliseconds) {
    final seconds = (milliseconds / 1000).truncate();
    final minutes = (seconds / 60).truncate();
    final hours = (minutes / 60).truncate();

    final hoursStr = hours.toString().padLeft(2, '0');
    final minutesStr = (minutes % 60).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours > 0) {
      return '$hoursStr:$minutesStr:$secondsStr';
    } else {
      return '$minutesStr:$secondsStr';
    }
  }
}