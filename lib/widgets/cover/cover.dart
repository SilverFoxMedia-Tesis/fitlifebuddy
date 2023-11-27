import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/spacing/container_sizes.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:flutter/material.dart';

class Cover extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const Cover({
    super.key, 
    required this.title, 
    required this.description, 
    this.image = '../assets/images/cover_photo.png', 
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyle.robotoSemibold36.copyWith(
                color: AppColors.secondary
              ),
            ),
            AppSpacing.spacingVerticalXxl,
            SizedBox(
              width: 590,
              child: Text(
                description,
                style: AppTextStyle.robotoMedium24.copyWith(
                  color: AppColors.secondary
                ),
                textAlign: TextAlign.center,
              ),
            ),
            AppSpacing.spacingVerticalXxl,
            Image.asset(
              image,
              width: ContainerSizes.coverPhotoWeight,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
      ),
    );
  }
}