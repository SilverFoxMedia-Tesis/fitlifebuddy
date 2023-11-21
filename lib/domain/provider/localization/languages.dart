import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/languages_code.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {};

  static Future<void> init() async {
    final keys = await _readJson();
    Get.clearTranslations();
    Get.addTranslations(keys);
  }

  static Future<Map<String, Map<String, String>>> _readJson() async {
    Map<String, Map<String, String>> keys = {};
    for (var languageCode in LanguageCode.values) {
      final res = await rootBundle
          .loadString('assets/languages/${languageCode.code}.json');
      Map<String, String> data = Map.from(jsonDecode(res));
      keys[languageCode.code] = data;
    }

    return keys;
  }
}
