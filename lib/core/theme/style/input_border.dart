import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:flutter/material.dart';

class AppInputBorder {
  static const hiddenBorder = OutlineInputBorder(
    borderRadius: AppBorderRadius.borderRadius14,
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  );
  static const focusedBorder = OutlineInputBorder(
    borderRadius: AppBorderRadius.borderRadius14,
    borderSide: BorderSide(
      color: AppColors.primary,
    ),
  );
  static const errorBorder = OutlineInputBorder(
    borderRadius: AppBorderRadius.borderRadius14,
    borderSide: BorderSide(
      color: AppColors.danger,
    ),
  );
}
