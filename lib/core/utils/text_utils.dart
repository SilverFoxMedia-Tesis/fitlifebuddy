import 'dart:convert';

import 'package:fitlifebuddy/core/utils/maps.dart';
import 'package:fitlifebuddy/domain/model/food.dart';
import 'package:get/get.dart';

String fixEncoding(String input) {
  List<int> bytes = latin1.encode(input);
  String fixed = utf8.decode(bytes);
  return fixed;
}

  String getMealFullname(List<Food> foods) {
    if (foods.isEmpty) return '';
    final names = foods.map((food) => translateFood(food.id!)).toList();
    if (names.isEmpty) return '';
    if (names.length == 1) {
      return names.first.capitalizeFirst ?? '';
    }
    return '${names.sublist(0, names.length - 1).join(', ')} y ${names.last}'.capitalizeFirst ?? '';
  }