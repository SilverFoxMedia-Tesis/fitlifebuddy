import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:flutter/material.dart';

class BorderRadiusWrapper {
  static const borderRadiusXs =
      BorderRadius.all(Radius.circular(AppBorderRadius.borderRadiusXs));
  static const borderRadiusSm =
      BorderRadius.all(Radius.circular(AppBorderRadius.borderRadiusSm));
  static const borderRadiusMd =
      BorderRadius.all(Radius.circular(AppBorderRadius.borderRadiusMd));
  static const borderRadiusLg =
      BorderRadius.all(Radius.circular(AppBorderRadius.borderRadiusLg));
  static const borderRadiusXl =
      BorderRadius.all(Radius.circular(AppBorderRadius.borderRadiusXl));
    static const borderRadiusXxl =
      BorderRadius.all(Radius.circular(AppBorderRadius.borderRadiusXxl));
  static const borderRadiusXxxl =
      BorderRadius.all(Radius.circular(AppBorderRadius.borderRadiusXxxl));

  static const borderRadiusRightLg =
      BorderRadius.only(
        topRight: Radius.circular(AppBorderRadius.borderRadiusLg), 
        bottomRight: Radius.circular(AppBorderRadius.borderRadiusLg)
      );
}