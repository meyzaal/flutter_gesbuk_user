import 'package:intl/intl.dart';

class ParseDate {
  static String returnTime(DateTime date) {
    return DateFormat.Hm().format(date);
  }

  static String returnYMD(DateTime date) {
    return DateFormat.yMd().format(date);
  }

  static String returnDay(DateTime date) {
    return DateFormat.d().format(date);
  }

  static String returnMonth(DateTime date) {
    return DateFormat.MMMM().format(date);
  }

  static String returnYear(DateTime date) {
    return DateFormat.y().format(date);
  }
}
