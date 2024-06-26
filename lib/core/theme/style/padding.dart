import 'package:fitlifebuddy/core/theme/size/space.dart';
import 'package:flutter/material.dart';

class AppPadding {
  static const padding8 = EdgeInsets.all(Space.space8);
  static const padding16 = EdgeInsets.all(Space.space16);
  static const padding24 = EdgeInsets.all(Space.space24);
  static const padding32 = EdgeInsets.all(Space.space32);

  static const paddingHorizontal16 = EdgeInsets.symmetric(horizontal: Space.space16);
  
  static const paddingVertical32 = EdgeInsets.symmetric(vertical: Space.space32);

  static const paddingOnlyTop24 = EdgeInsets.only(top: Space.space24);

  static const paddingOnlyBottom16 = EdgeInsets.only(bottom: Space.space16);

  static const paddingPage = EdgeInsets.symmetric(vertical: Space.space32, horizontal: Space.space14 * 3);
  static const paddingDialog = EdgeInsets.symmetric(vertical: Space.space32, horizontal: Space.space24);
  static const paddingDateTimeLine = EdgeInsets.symmetric(vertical: Space.space16, horizontal: Space.space14);
}