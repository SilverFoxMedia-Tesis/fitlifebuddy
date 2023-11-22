import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/spacing/container_sizes.dart';
import 'package:fitlifebuddy/core/theme/wrapper/border_radius_wrapper.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:flutter/material.dart';

class BaseButtom extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const BaseButtom({
    super.key, 
    required this.text, 
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: ContainerSizes.baseButtonWidth,
        height: ContainerSizes.baseButtonHeight,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadiusWrapper.borderRadiusXxl,
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