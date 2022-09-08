import 'package:intl/intl.dart';

class ParseDate {
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
