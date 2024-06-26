import 'package:fitlifebuddy/core/theme/size/space.dart';
import 'package:flutter/material.dart';

class AppBorderRadius {
  static const borderRadius14 =
      BorderRadius.all(Radius.circular(Space.space14));
  static const borderRadiusLg =
      BorderRadius.all(Radius.circular(Space.space16));
  static const borderRadiusXl =
      BorderRadius.all(Radius.circular(Space.space20));
    static const borderRadius24 =
      BorderRadius.all(Radius.circular(Space.space24));
  static const borderRadiusXxxl =
      BorderRadius.all(Radius.circular(Space.space32));

  static const borderRadiusRight14 =
      BorderRadius.only(
        topRight: Radius.circular(Space.space14), 
        bottomRight: Radius.circular(Space.space14),
      );
}