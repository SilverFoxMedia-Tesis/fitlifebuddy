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
              'meals_of_the_day'.tr,
              style: AppTextStyle.robotoSemibold20,
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
        for (var meal in controller.meals)
          Padding(
            padding: AppPadding.paddingOnlyTop24,
            child: _buildMeal(meal),
          ),
      ],
    );
  }

  Widget _buildMeal(Meal meal) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          meal.timeMeal?.label ?? '',
          style: AppTextStyle.robotoMedium20,
        ),
        AppSpacing.spacingVertical24,
        PlanItemCard(
          text: meal.fullname ?? '', 
          image: meal.imageUrl,
          onTap: () => controller.viewMealDetails(meal.id!),
        ),
      ],
    );
  }
}