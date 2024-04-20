import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/plan_page/plan_controller.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealsView extends GetView<PlanController> {
  const MealsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMeal(
            'breakfast'.tr,
            'Tostada con palta y huevo',
            controller.breakfastImage.value,
            controller.viewMealDetails,
          ),
          AppSpacing.spacingVertical24,
          _buildMeal(
            'lunch'.tr,
            'Verduras y pollo al vapor',
            controller.lunchImage.value,
            controller.viewMealDetails,
          ),
          AppSpacing.spacingVertical24,
          _buildMeal(
            'dinner'.tr,
            'Chuleta asada con verduras',
            controller.dinnerImage.value,
            controller.viewMealDetails,
          ),
      ],
      ),
    );
  }

  Widget _buildMeal(String mealType, String mealName, String image, void Function()? onTapMeal) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mealType,
          style: AppTextStyle.robotoSemibold20.copyWith(
            color: AppColors.secondary,
          ),
        ),
        AppSpacing.spacingVertical24,
        PlanItemCard(
          text: mealName, 
          image: image,
          onTap: onTapMeal,
        ),
      ],
    );
  }
}

