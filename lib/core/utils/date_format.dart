import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateFormats {
  static const initial = 'yyyy-MM-dd';
  static const long = 'EEEE, d \'de\' MMMM';
  static const birthday = 'd \'de\' MMMM \'de\' y';
}

String fromString(String dateTime, String dateFormat) {
  final DateTime result = DateTime.parse(dateTime);
  return DateFormat(dateFormat, 'es').format(result);
}

String fromDateToInitial(DateTime dateTime) {
  return DateFormat(DateFormats.initial).format(dateTime);
}

String fromDateToLong(DateTime dateTime) {
  return DateFormat(DateFormats.long, 'es').format(dateTime).capitalizeFirst!;
}

String fromDateToBirthday(DateTime dateTime) {
  return DateFormat(DateFormats.birthday, 'es').format(dateTime);
}

String fromStringToBirthday(String dateTime) {
  return fromString(dateTime, DateFormats.birthday);
}