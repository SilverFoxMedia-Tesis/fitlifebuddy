import 'dart:convert';

String fixEncoding(String input) {
  List<int> bytes = latin1.encode(input);
  String fixed = utf8.decode(bytes);
  return fixed;
}