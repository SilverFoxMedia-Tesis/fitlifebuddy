import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
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
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (controller.hasMeals)
              _buildMeals(),
            if (!controller.hasMeals)
              _buildEmptyList(),
        ],
        ),
      ),
    );
  }

  Widget _buildMeals() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: controller.meals.map((meal) {
        return Padding(
          padding: AppPadding.paddingOnlyTop24,
          child: _buildMeal(meal, null, null),
        );
      }).toList(),
    );
  }

  Widget _buildMeal(Meal meal, String? image, void Function()? onTapMeal) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          meal.timeMeal?.label ?? '',
          style: AppTextStyle.robotoSemibold20.copyWith(
            color: AppColors.secondary,
          ),
        ),
        AppSpacing.spacingVertical24,
        PlanItemCard(
          text: controller.getMealName(0), 
          image: image,
          onTap: onTapMeal,
        ),
      ],
    );
  }

  Widget _buildEmptyList() {
    return Padding(
      padding: AppPadding.paddingOnlyTop24,
      child: Text(
        'no_routine'.tr,
        style: AppTextStyle.robotoRegular16.copyWith(
          color: AppColors.secondary,
        ),
      ),
    );
  }
}

