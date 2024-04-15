import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:flutter/material.dart';

class BaseButtom extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double width;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool enabled;

  const BaseButtom({
    super.key, 
    required this.text,
    this.textColor = AppColors.white,
    this.width = ContainerSize.baseButtonWidth,
    this.backgroundColor = AppColors.primary,
    this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: ContainerSize.baseButtonHeight,
        decoration: BoxDecoration(
          color: enabled ? backgroundColor : AppColors.disabled,
          borderRadius: AppBorderRadius.borderRadius24,
        ),
        child: Text(
          text,
          style: AppTextStyle.robotoSemibold14.copyWith(
            color: textColor,
          ),
          textAlign: TextAlign.center,
          ),
      ),
    );
  }
}