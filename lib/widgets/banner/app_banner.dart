import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  final String text;
  const AppBanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.paddingAppBanner,
      width: ContainerSize.bannerWidth,
      height: ContainerSize.bannerHeight,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: AppBorderRadius.borderRadiusLg,
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