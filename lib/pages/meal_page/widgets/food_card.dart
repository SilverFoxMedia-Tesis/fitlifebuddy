import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/domain/model/food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 400,
          height: 263,
          padding: AppPadding.paddingDialog,
          decoration: const BoxDecoration(
            color: AppColors.light,
            borderRadius: AppBorderRadius.borderRadiusXl,
            boxShadow: [AppBoxShadow.secondary25Blur8],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.name ?? '',
                style: AppTextStyle.robotoSemibold20,
              ),
              AppSpacing.spacingVertical8,
              Text(
                'protein'.tr,
                style: AppTextStyle.robotoSemibold14,
              ),
              AppSpacing.spacingVertical4,
              Text(
                '${food.fiber} g',
                style: AppTextStyle.robotoSemibold14.copyWith(
                  color: AppColors.primary,
                ),
              ),
              AppSpacing.spacingVertical4,
              Text(
                'carbs'.tr,
                style: AppTextStyle.robotoSemibold14,
              ),
              AppSpacing.spacingVertical4,
              Text(
                '${food.carbs} g',
                style: AppTextStyle.robotoSemibold14.copyWith(
                  color: AppColors.primary,
                ),
              ),
              AppSpacing.spacingVertical4,
              Text(
                'fats'.tr,
                style: AppTextStyle.robotoSemibold14,
              ),
              AppSpacing.spacingVertical4,
              Text(
                '${food.fat} g',
                style: AppTextStyle.robotoSemibold14.copyWith(
                  color: AppColors.primary,
                ),
              ),
              AppSpacing.spacingVertical4,
              Text(
                'calories'.tr,
                style: AppTextStyle.robotoSemibold14,
              ),
              AppSpacing.spacingVertical4,
              Text(
                '${food.calories} g',
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
          child: Image.network(
            food.imageUrl ?? AppIcons.notFound,
            width: 152,
          height: 160,
          ),
        ),
      ],
    );
  }
}