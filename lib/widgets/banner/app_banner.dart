import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/spacing/container_sizes.dart';
import 'package:fitlifebuddy/core/theme/wrapper/border_radius_wrapper.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  final String text;
  const AppBanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.paddingAppBanner,
      width: ContainerSizes.bannerWidth,
      height: ContainerSizes.bannerHeight,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadiusWrapper.borderRadiusLg,
      ),
      child: Text(
        text,
        style: AppTextStyle.robotoSemibold24.copyWith(
          color: AppColors.white,
        ),
        textAlign: TextAlign.center,
        ),
    );
  }
}