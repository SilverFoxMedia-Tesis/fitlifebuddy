import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/wrapper/border_radius_wrapper.dart';
import 'package:flutter/material.dart';

class AppInputBorder {
  static const hiddenBorder = OutlineInputBorder(
    borderRadius: BorderRadiusWrapper.borderRadius14,
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  );
  static const focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadiusWrapper.borderRadius14,
    borderSide: BorderSide(
      color: AppColors.primary,
    ),
  );
  static const errorBorder = OutlineInputBorder(
    borderRadius: BorderRadiusWrapper.borderRadius14,
    borderSide: BorderSide(
      color: AppColors.danger,
    ),
  );
}
