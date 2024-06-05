import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/pages/plan_page/plan_controller.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/widgets/empty_result/empty_result.dart';
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
            Text(
              'Comidas del día',
              style: AppTextStyle.robotoSemibold20.copyWith(
                color: AppColors.secondary,
              ),
            ),
            if (controller.hasMeals)
              _buildMeals(),
            if (!controller.hasMeals)
              EmptyResult(message: 'no_meals'.tr),
        ],
        ),
      ),
    );
  }

  Widget _buildMeals() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (var entry in controller.meals.entries)
          Padding(
            padding: AppPadding.paddingOnlyTop24,
            child: _buildMeal(entry.key, entry.value),
          ),
      ],
    );
  }

  Widget _buildMeal(int index, Meal meal) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          meal.timeMeal?.label ?? '',
          style: AppTextStyle.robotoMedium20.copyWith(
            color: AppColors.secondary,
          ),
        ),
        AppSpacing.spacingVertical24,
        PlanItemCard(
          text: meal.fullname ?? '', 
          image: meal.imageUrl,
          onTap: () => controller.viewMealDetails(index),
        ),
      ],
    );
  }
}