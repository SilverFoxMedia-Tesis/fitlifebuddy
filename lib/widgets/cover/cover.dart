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
    required this.image, 
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
              title,
              style: AppTextStyle.robotoSemibold36.copyWith(
                color: AppColors.secondary
              ),
              textAlign: TextAlign.center,
            ),
            AppSpacing.spacingVerticalXxl,
            SizedBox(
              width: 500,
              child: Text(
                description,
                style: AppTextStyle.robotoMedium20.copyWith(
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