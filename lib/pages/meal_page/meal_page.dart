import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/meal_page/meal_controller.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/buttons/action_severity.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:fitlifebuddy/widgets/custom_bar/custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealPage extends GetView<MealController> {
  const MealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: Padding(
        padding: AppPadding.paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.spacingVertical24,
            buildCustomBar(),
            AppSpacing.spacingVertical24,
            Text(
              controller.currentMeal.value.getName(),
              style: AppTextStyle.robotoSemibold20.copyWith(
                color: AppColors.secondary
              ),
            ),
            AppSpacing.spacingVertical24,
            Text(
              'ingredients'.tr,
              style: AppTextStyle.robotoSemibold20.copyWith(
                color: AppColors.secondary
              ),
            ),
            AppSpacing.spacingVertical24,
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              shrinkWrap: true,
              childAspectRatio: 3,
              children: controller.currentMeal.value.foods!.asMap().entries.map((entry) {
                final food = entry.value;
                return PlanItemCard(
                  text: food.name ?? '',
                  image: food.imageUrl,
                  onTap: () => controller.viewFoodInformation(food),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomBar() {
    return CustomBar(
      title: '${controller.currentMeal.value.timeMeal?.label} | ',
      extraTitle: controller.getMealDate(),
      onBackPressed: () => Get.offAllNamed(AppRoutes.plan),
      actions: [
        BaseButton(
          text: 'edit_food'.tr,
          actionSeverity: ActionSeverity.warning,
          onTap: () => controller.openChangeMeal(controller.currentMeal.value.timeMeal),
        ),
        AppSpacing.spacingHorizontal16,
        BaseButton(
          text: 'completed'.tr,
          onTap: controller.changeMealToCompleted,
        ),
      ],
    );
  }
}