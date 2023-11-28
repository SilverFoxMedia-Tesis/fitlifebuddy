import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/spacing/container_sizes.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/wrapper/border_radius_wrapper.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:fitlifebuddy/domain/enum/notification_type.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final NotificationType type;
  final String description;
  final String date;
  final void Function()? onTap;

  const NotificationCard({
    super.key, 
    required this.type,
    required this.description, 
    required this.date, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: AppPadding.paddingLg,
        width: ContainerSizes.notificationCardWidth,
        height: ContainerSizes.notificationCardHeight,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadiusWrapper.borderRadiusLg,
          boxShadow: [AppBoxShadows.secondary25Blur8],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type.name,
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
      ),
    );
  }
}