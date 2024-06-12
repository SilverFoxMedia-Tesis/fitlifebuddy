import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/core/utils/maps.dart';
import 'package:fitlifebuddy/domain/model/food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodInformationDialog extends StatelessWidget {
  final Food food;
  const FoodInformationDialog({
    required this.food,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: AppColors.light,
      shape: const RoundedRectangleBorder(
        borderRadius: AppBorderRadius.borderRadius14,
      ),
      content: Stack(
        children: [
          SizedBox(
            width: 400,
            child: Padding(
              padding: AppPadding.paddingDialog,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodsESMap[food.id] ?? '',
                    style: AppTextStyle.robotoSemibold20,
                  ),
                  AppSpacing.spacingVertical8,
                  buildNutrient(
                    'protein'.tr,
                    '${food.protein} g',
                  ),
                  AppSpacing.spacingVertical8,
                  buildNutrient(
                    'carbs'.tr,
                    '${food.carbs} g',
                  ),
                  AppSpacing.spacingVertical8,
                  buildNutrient(
                    'fats'.tr,
                    '${food.fat} g',
                  ),
                  AppSpacing.spacingVertical8,
                  buildNutrient(
                    'calories'.tr,
                    '${food.calories} g',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: AppBorderRadius.borderRadius14,
              child: Image.network(
                food.imageUrl ?? AppIcons.notFound,
                width: 152,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNutrient(String name, String description) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppTextStyle.robotoSemibold14,
        ),
        AppSpacing.spacingVertical4,
        Text(
          description,
          style: AppTextStyle.robotoMedium14.copyWith(
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}