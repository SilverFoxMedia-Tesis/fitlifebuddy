import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/wrapper/border_radius_wrapper.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 400,
          height: 263,
          padding: AppPadding.paddingDialog,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadiusWrapper.borderRadiusXl,
            boxShadow: [AppBoxShadows.secondary25Blur8],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Huevo frito',
                style: AppTextStyle.robotoSemibold20.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              AppSpacing.spacingVerticalSm,
              Text(
                'Proteína',
                style: AppTextStyle.robotoSemibold14.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              AppSpacing.spacingVerticalXs,
              Text(
                '6 g',
                style: AppTextStyle.robotoSemibold14.copyWith(
                  color: AppColors.primary,
                ),
              ),
              AppSpacing.spacingVerticalXs,
              Text(
                'Carbohidratos',
                style: AppTextStyle.robotoSemibold14.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              AppSpacing.spacingVerticalXs,
              Text(
                '0.6 g',
                style: AppTextStyle.robotoSemibold14.copyWith(
                  color: AppColors.primary,
                ),
              ),
              AppSpacing.spacingVerticalXs,
              Text(
                'Grasa',
                style: AppTextStyle.robotoSemibold14.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              AppSpacing.spacingVerticalXs,
              Text(
                '7 g',
                style: AppTextStyle.robotoSemibold14.copyWith(
                  color: AppColors.primary,
                ),
              ),
              AppSpacing.spacingVerticalXs,
              Text(
                'Calorías',
                style: AppTextStyle.robotoSemibold14.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              AppSpacing.spacingVerticalXs,
              Text(
                '90 g',
                style: AppTextStyle.robotoSemibold14.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            AppIcons.food1,
            width: 152,
          height: 160,
          ),
        ),
      ],
    );
  }
}