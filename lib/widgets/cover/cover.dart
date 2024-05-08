import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cover extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;

  const Cover({
    super.key, 
    this.title, 
    this.description,
    this.image, 
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? 'welcome_to'.tr,
              style: AppTextStyle.robotoSemibold36.copyWith(
                color: AppColors.secondary
              ),
              textAlign: TextAlign.center,
            ),
            AppSpacing.spacingVertical24,
            SizedBox(
              width: 500,
              child: Text(
                description ?? 'phrase0'.tr,
                style: AppTextStyle.robotoMedium20.copyWith(
                  color: AppColors.secondary
                ),
                textAlign: TextAlign.center,
              ),
            ),
            AppSpacing.spacingVertical24,
            Image.asset(
              image ?? AppIcons.coverPhoto,
              width: ContainerSize.coverPhotoWeight,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
      ),
    );
  }
}