import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/pages/plan_page/plan_controller.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/empty_result/empty_result.dart';
import 'package:fitlifebuddy/widgets/loading/loading_widget.dart';
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
          Text(
            'meals_of_the_day'.tr,
            style: AppTextStyle.robotoSemibold20,
          ),
          Obx(
            () => LoadingWidget(
              isLoading: controller.loading.value,
              child: controller.hasMeals
                ? _buildMeals()
                : EmptyResult(message: 'no_meals'.tr),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMeals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < controller.meals.length; i++)
          ...[
              AppSpacing.spacingVertical24,
              _buildMeal(i, controller.meals[i]),
          ],
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
          style: AppTextStyle.robotoMedium20,
        ),
        AppSpacing.spacingVertical24,
        PlanItemCard(
          text: meal.fullname ?? '', 
          image: meal.imageUrl,
          onTap: () => Get.toNamed(AppRoutes.meal, arguments: meal),
        ),
      ],
    );
  }
}