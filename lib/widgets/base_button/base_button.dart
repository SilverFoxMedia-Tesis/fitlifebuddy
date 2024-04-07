import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:flutter/material.dart';

class BaseButtom extends StatelessWidget {
  final String text;
  final double width;
  final Color? color;
  final void Function()? onTap;

  const BaseButtom({
    super.key, 
    required this.text,
    this.width = ContainerSize.baseButtonWidth,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: ContainerSize.baseButtonHeight,
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: AppBorderRadius.borderRadiusXxl,
        ),
        child: Text(
          text,
          style: AppTextStyle.robotoSemibold14.copyWith(
            color: AppColors.white,
          ),
          textAlign: TextAlign.center,
          ),
      ),
    );
  }
}