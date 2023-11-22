import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCard extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final void Function()? onTap;

  const AppCard({
    super.key, 
    required this.title, 
    required this.description, 
    required this.icon, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: AppPadding.paddingXxxl,
        width: 592,
        height: 160,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [AppBoxShadows.secondary25Blur8],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.robotoSemibold24.copyWith(
                    color: AppColors.secondary
                  ),
                ),
                AppSpacing.spacingVerticalMd,
                Text(
                  description,
                  style: AppTextStyle.robotoMedium14.copyWith(
                    color: AppColors.primary
                  ),
                )
              ],
            ),
            SvgPicture.asset(
              icon,
              width: 32,
              height: 32,
            )
          ],
        ),
      ),

    );
  }
}