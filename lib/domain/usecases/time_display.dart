import 'dart:core';

class TimeDisplay {
  static const String timePartDelimiter = ':';
  static const int _secondsInOneMinute = 60;

  static String timeRemaining(int timeInSeconds) {
    final hours = _getHours(timeInSeconds);
    final minutes = _getMinutes(timeInSeconds);
    final seconds = _getSeconds(timeInSeconds);

    final minutesAndSeconds = '$minutes$timePartDelimiter$seconds';
    final hasHours = hours > 0;
    final timeRemaining = hasHours
        ? "$hours$timePartDelimiter$minutesAndSeconds"
        : minutesAndSeconds;

    return timeRemaining;
  }

  static int _getHours(int timeInSeconds) {
    const secondsInOneHour = _secondsInOneMinute * _secondsInOneMinute;
    final hours = (timeInSeconds / secondsInOneHour).floor();
    return hours;
  }

  static String _getMinutes(int timeInSeconds) {
    final minutesFromSeconds = _getMinutesFromSeconds(timeInSeconds);
    final minutes = _getTimePartWithPadding(minutesFromSeconds);
    return minutes;
  }

  static int _getMinutesFromSeconds(int timeInSeconds) =>
      ((timeInSeconds / _secondsInOneMinute) % _secondsInOneMinute).floor();

  static String _getSeconds(int timeInSeconds) {
    final secondsFromSeconds = _getSecondsFromSeconds(timeInSeconds);
    final seconds = _getTimePartWithPadding(secondsFromSeconds);
    return seconds;
  }

  static int _getSecondsFromSeconds(int timeInSeconds) =>
      timeInSeconds % _secondsInOneMinute;

  static String _getTimePartWithPadding(int timePart) {
    const String paddingChar = '0';
    const int timePartCharWidth = 2;
    return timePart.toString().padLeft(timePartCharWidth, paddingChar);
  }
}
