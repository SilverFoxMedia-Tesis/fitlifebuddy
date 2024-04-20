import 'package:intl/intl.dart';

class DateFormats {
  static const initial = "yyyy-MM-dd";
}

String fromString(String dateTime, String dateFormat) {
  final DateTime result = DateTime.parse(dateTime);
  return DateFormat(dateFormat).format(result);
}

String fromDate(DateTime dateTime, String dateFormat) {
  return DateFormat(dateFormat).format(dateTime);
}

String fromStringToInitial(String dateTime) {
  final DateTime result = DateTime.parse(dateTime);
  return DateFormat(DateFormats.initial).format(result);
}

String fromDateToInitial(DateTime dateTime) {
  return DateFormat(DateFormats.initial).format(dateTime);
}