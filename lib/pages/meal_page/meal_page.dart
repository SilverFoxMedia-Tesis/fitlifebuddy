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
import 'package:fitlifebuddy/widgets/empty_result/empty_result.dart';
import 'package:fitlifebuddy/widgets/loading/loading_widget.dart';
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
            Obx(
              () => Text(
                controller.fullname,
                style: AppTextStyle.robotoSemibold20,
              ),
            ),
            AppSpacing.spacingVertical24,
            Text(
              'ingredients'.tr,
              style: AppTextStyle.robotoSemibold20,
            ),
            AppSpacing.spacingVertical24,
            Obx(
              () => LoadingWidget(
                isLoading: controller.loading.value,
                child: controller.hasFoods
                  ? buildFoods()
                  : EmptyResult(message: 'no_foods'.tr),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomBar() {
    return Obx(
      () => CustomBar(
        title: '${controller.timeMeal} | ',
        extraTitle: controller.currentDateTime,
        onBackPressed: () => Get.toNamed(AppRoutes.plan),
        actions: [
          BaseButton(
            text: 'edit_meal'.tr,
            actionSeverity: ActionSeverity.warning,
            onTap: () => controller.openChangeMealDialog(),
            disabled: controller.completed,
          ),
          AppSpacing.spacingHorizontal16,
          BaseButton(
            text: controller.completed ? 'completed'.tr : "No completado",
            onTap: () async => await controller.changeMealToCompleted(),
            loading: controller.isChanging.value,
            disabled: controller.completed,
          ),
        ],
      ),
    );
  }

  Widget buildFoods() {
    return Expanded(
      child: Obx(
        () => Wrap(
          spacing: 24,
          runSpacing: 24,
          children: List.generate(controller.foodsLength, (index) {
              final food = controller.currentMeal.value.foods![index];
              return PlanItemCard(
                text: controller.translatedWord(food.id!),
                image: food.imageUrl,
                onTap: () => controller.openFoodInformationDialog(food),
              );
            },
          ),
        ),
      ),
    );
  }
}