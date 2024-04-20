import 'package:flutter/services.dart';

class InputFormatters {
  static List<TextInputFormatter> get lettersOnly {
    return [
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
    ];
  }

  static List<TextInputFormatter> get numbersOnly {
    return [
      FilteringTextInputFormatter.digitsOnly,
    ];
  }

  static List<TextInputFormatter> get alphanumericOnly {
    return [
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
    ];
  }
}