import 'package:fitlifebuddy/core/theme/size/space.dart';
import 'package:flutter/material.dart';

class AppPadding {
  static const padding16 = EdgeInsets.all(Space.space16);
  static const padding32 = EdgeInsets.all(Space.space32);

  static const paddingHorizontal16 = EdgeInsets.symmetric(horizontal: Space.space16);
  static const paddingHorizontal32 = EdgeInsets.symmetric(horizontal: Space.space32);
  
  static const paddingVertical32 = EdgeInsets.symmetric(vertical: Space.space32);

  static const paddingPage = EdgeInsets.symmetric(vertical: Space.space32, horizontal: Space.space14 * 3);
  static const paddingAppCard = EdgeInsets.symmetric(horizontal: Space.space14 * 3);
  static const paddingPage2 = EdgeInsets.symmetric(vertical: Space.space32 * 4);
  static const paddingDialog = EdgeInsets.symmetric(vertical: Space.space32, horizontal: Space.space24);
}