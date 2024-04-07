import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
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
        padding: AppPadding.paddingAppCard,
        width: ContainerSize.appCardWidth,
        height: ContainerSize.appCardHeight,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: AppBorderRadius.borderRadiusLg,
          boxShadow: [AppBoxShadow.secondary25Blur8],
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
                AppSpacing.spacingVertical14,
                Text(
                  description,
                  style: AppTextStyle.robotoMedium14.copyWith(
                    color: AppColors.primary
                  ),
                )
              ],
            ),
            Padding(
              padding: AppPadding.paddingHorizontal16,
              child: SvgPicture.asset(
                icon,
                height: ContainerSize.appCardIconSize,
                fit: BoxFit.fitHeight,
                colorFilter: const ColorFilter.mode(AppColors.secondary, BlendMode.srcIn),
              ),
            )
          ],
        ),
      ),

    );
  }
}