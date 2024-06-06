import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
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
        padding: AppPadding.padding16,
        width: ContainerSize.notificationCardWidth,
        height: ContainerSize.notificationCardHeight,
        decoration: const BoxDecoration(
          color: AppColors.light,
          borderRadius: AppBorderRadius.borderRadiusLg,
          boxShadow: [AppBoxShadow.secondary25Blur8],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type.name,
              style: AppTextStyle.robotoSemibold24,
            ),
            AppSpacing.spacingVertical14,
            Text(
              description,
              style: AppTextStyle.robotoMedium14.copyWith(
                color: AppColors.primary,
              ),
            ),
            AppSpacing.spacingVertical14,
            Text(
              description,
              style: AppTextStyle.robotoMedium14.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}