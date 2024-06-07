import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/utils/maps.dart';
import 'package:fitlifebuddy/pages/meal_page/meal_controller.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/widgets/app_dialog/app_dialog.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:fitlifebuddy/widgets/empty_result/empty_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeMealDialog extends GetView<MealController> {
  const ChangeMealDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'select_a_meal'.tr,
      extraContent: controller.hasOptions
        ? buildOptions()
        : EmptyResult(message: 'no_options'.tr),
      actions: [
        BaseButton(
          text: 'edit_meal'.tr,
          onTap: () {},
          disabled: true,
        ),
      ],
    );
  }

  Widget buildOptions() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.availableMeals.length,
        itemBuilder: (context, index) {
          final meal = controller.availableMeals[index];
          return Column(
            children: [
              InkWell(
                onTap: () => controller.onMealSelected(meal),
                child: PlanItemCard(
                  text: foodsESMap[meal.foods?.first.id] ?? '',
                  image: meal.imageUrl,
                  border: (controller.mealSelected.value == meal)
                    ? true : null,
                ),
              ),
              AppSpacing.spacingVertical20,
            ],
          );
        },
      ),
    );
  }
}