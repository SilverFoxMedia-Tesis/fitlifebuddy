import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/box_decoration.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/widgets/text_container/text_container_style.dart';
import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String text;
  final TextContainerStyle? style;
  final IconData? icon;
  final void Function()? onIconPressed;

  const TextContainer({
    super.key, 
    required this.text,
    this.style = TextContainerStyle.type1,
    this.icon,
    this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: buildMaxWidth(),
      ),
      padding: AppPadding.padding16,
      decoration: buildBoxDecoration(),
      child: Row(
        mainAxisAlignment: buildMainAlignment(),
        children: [
          Text(
            text,
            style: buildTextStyle(),
          ),
          if (icon != null)
            InkWell(
              onTap: onIconPressed,
              child: Icon( 
                icon,
                size: ContainerSize.iconSize,
                color: AppColors.secondary,
              ),
            ),
        ],
      ),
    );
  }

  TextStyle buildTextStyle() {
    switch (style) {
      case TextContainerStyle.type2:
        return AppTextStyle.robotoSemibold14;
      default:
      return AppTextStyle.robotoRegular14;
    }
  }

  MainAxisAlignment buildMainAlignment() {
    switch (style) {
      case TextContainerStyle.type2:
        return MainAxisAlignment.center;
      default:
      return MainAxisAlignment.spaceBetween;
    }
  }

  BoxDecoration buildBoxDecoration() {
    switch (style) {
      case TextContainerStyle.type2:
        return AppBoxDecoration.lightRadius24;
      default:
      return AppBoxDecoration.lightRadius14;
    }
  }

  double buildMaxWidth() {
    switch (style) {
      case TextContainerStyle.type2:
        return 160;
      default:
      return ContainerSize.baseContainerWidth;
    }
  }
}