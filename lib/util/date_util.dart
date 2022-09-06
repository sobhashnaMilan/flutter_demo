import 'package:intl/intl.dart';

/// DEV NOTE: for more date and time formats, refer
/// https://api.flutter.dev/flutter/intl/DateFormat-class.html

class DateUtil {
  /// convert datetime to string
  /// by default [isUTC] flag is false
  /// set it to TRUE if you want to convert utc date to string
  static String dateTimeToString({
    required DateTime date,
    String requiredFormat = "yyyy-MM-dd HH:mm:ss",
    bool isUTC = false,
  }) {
    try {
      return DateFormat(requiredFormat).format(isUTC ? date.toUtc() : date);
    } catch (e) {
      throw 'Unable to convert $e';
    }
  }

  /// convert string to datetime
  /// by default [isUTC] flag is false
  ///set it to TRUE if you want to convert string to utc date
  static DateTime stringToDateTime({
    required String date,
    bool isUTC = false,
  }) {
    try {
      if (isUTC) {
        if (!date.contains("Z")) {
          throw 'Date $date is not in UTC format';
        }
        return DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, isUTC).toLocal();
      } else {
        if (date.contains("Z")) {
          throw 'Unable to convert, set [isUTC] flag to TRUE';
        }
        return DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
      }
    } catch (e) {
      throw 'Unable to convert $e';
    }
  }

  /// convert datetime to timestamp
  static int dateTimeToTimestamp({required DateTime date}) {
    try {
      return date.millisecondsSinceEpoch;
    } catch (e) {
      throw 'Unable to convert $e';
    }
  }

  /// convert timestamp to datetime
  static DateTime timestampToDateTime({required int timestamp}) {
    try {
      return DateTime.fromMillisecondsSinceEpoch(timestamp);
    } catch (e) {
      throw 'Unable to convert $e';
    }
  }

  /// returns the formatted date in [requiredFormat]
  static String getDateInRequiredFormat({
    required String date,
    required String requiredFormat,
  }) {
    try {
      return DateFormat(requiredFormat).format(DateTime.parse(date));
    } catch (e) {
      throw 'Unable to convert date $e';
    }
  }

  /* 
    consider a date for eg.: 2022-05-20 10:23:17.461
    results of flag:
    1 -> 2022-05-20
    2 -> 20-05-2022
    3 -> 2022/05/20
    4 -> 20/05/2022
    5 -> 20
    6 -> 05
    7 -> 2022
    8 -> May
    default -> 20 May 2022
  */
  static String getFormattedDate({required String date, int flag = 0}) {
    try {
      switch (flag) {
        case 1:
          return DateFormat("yyyy-MM-dd").format(DateTime.parse(date));
        case 2:
          return DateFormat("dd-MM-yyyy").format(DateTime.parse(date));
        case 3:
          return DateFormat("yyyy/MM/dd").format(DateTime.parse(date));
        case 4:
          return DateFormat("dd/MM/yyyy").format(DateTime.parse(date));
        case 5:
          return DateFormat("d").format(DateTime.parse(date));
        case 6:
          return DateFormat("MM").format(DateTime.parse(date));
        case 7:
          return DateFormat("yyyy").format(DateTime.parse(date));
        case 8:
          return DateFormat("MMM").format(DateTime.parse(date));
        default:
          return DateFormat("d MMM yyyy").format(DateTime.parse(date));
      }
    } catch (e) {
      throw 'Unable to convert date $e';
    }
  }

  /* 
  consider a date for eg.: 2022-05-20 10:23:17.461
  results of flag:
  1 -> 10:23:17 AM
  2 -> 10
  3 -> 23
  4 -> 10:23
  default -> 10:23 AM
  */
  static String getFormattedTime({required String date, int flag = 0}) {
    try {
      switch (flag) {
        case 1:
          return DateFormat("hh:mm:ss a").format(DateTime.parse(date));
        case 2:
          return DateFormat("h").format(DateTime.parse(date));
        case 3:
          return DateFormat("m").format(DateTime.parse(date));
        case 4:
          return DateFormat("hh:mm").format(DateTime.parse(date));
        default:
          return DateFormat("hh:mm a").format(DateTime.parse(date));
      }
    } catch (e) {
      throw 'Unable to convert date $e';
    }
  }
}
