import 'dart:math';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String getFormattedNumber(String? countryCode) {
    String cNum = replaceAll(' ', '');
    if (cNum.isEmpty) return cNum;
    String formattedNum = '';
    while (cNum.isNotEmpty) {
      int ahedCount = min(cNum.length, 3);
      if (formattedNum.length > 6) {
        ahedCount = min(cNum.length, 4);
      }
      String ahed = cNum.substring(cNum.length - ahedCount, cNum.length);
      cNum = cNum.substring(0, cNum.length - ahed.length);
      formattedNum = '$ahed $formattedNum'.trim();
    }
    return '${countryCode ?? ''} $formattedNum'.trim();
  }
}

String getRandomStringForCaptcha({int setLength = 5}) {
  const String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  return String.fromCharCodes(Iterable.generate(setLength, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}

String dayHourMinuteSecondFunction(Duration duration) {
  String msg = "";
  String twoDigits(int n) => n.toString().padLeft(1, "0");

  String days = twoDigits(duration.inDays);
  msg += days == "0" ? "" : "$days D ";

  String twoDigitHours = twoDigits(duration.inHours.remainder(24));
  msg += twoDigitHours == "0" ? "" : "$twoDigitHours H ";

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  msg += twoDigitMinutes == "0" ? "" : "$twoDigitMinutes M ";

  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  msg += twoDigitSeconds + " S Remaining";

  return msg;
}
