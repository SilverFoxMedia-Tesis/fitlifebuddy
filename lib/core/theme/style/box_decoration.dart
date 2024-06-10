import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:flutter/material.dart';

class AppBoxDecoration {
  static const baseBoxDecoration =
    BoxDecoration(
      color: AppColors.light,
      borderRadius: AppBorderRadius.borderRadiusXl,
      boxShadow: [AppBoxShadow.secondary25Blur8],
    );
  static const lightRadius14 =
    BoxDecoration(
      color: AppColors.light,
      borderRadius: AppBorderRadius.borderRadius14,
      boxShadow: [AppBoxShadow.secondary25Blur8],
    );

  static const lightRadius24 =
    BoxDecoration(
      color: AppColors.light,
      borderRadius: AppBorderRadius.borderRadius24,
      boxShadow: [AppBoxShadow.secondary25Blur8],
    );
}