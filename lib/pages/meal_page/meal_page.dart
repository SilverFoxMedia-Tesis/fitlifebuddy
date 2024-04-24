import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/meal_page/meal_controller.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_icon_button/app_icon_button.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/size/container_size.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppIconButton(
                    iconData: Icons.arrow_back_ios_rounded,
                    iconColor: AppColors.secondary,
                    size: ContainerSize.iconSize,
                    onTap: () => Get.offAllNamed(AppRoutes.plan),
                    outlined: true,
                    ),
                    AppSpacing.spacingHorizontal14,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${controller.mealType.value} | ',
                            style: AppTextStyle.robotoSemibold24.copyWith(
                              color: AppColors.secondary,
                            ),
                          ),
                          TextSpan(
                            text: controller.getMealDate(),
                            style: AppTextStyle.robotoRegular24.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BaseButtom(
                      text: 'edit_food'.tr,
                      width: ContainerSize.baseButtonSmallWidth,
                      backgroundColor: AppColors.warning,
                      onTap: controller.openChangeMeal,
                    ),
                    AppSpacing.spacingHorizontal16,
                    BaseButtom(
                      text: 'completed'.tr,
                      width: ContainerSize.baseButtonSmallWidth,
                      backgroundColor: AppColors.secondary,
                      onTap: controller.changeMealToCompleted,
                    ),
                  ],
                ),
              ],
            ),
            AppSpacing.spacingVertical24,
            Text(
              controller.currentMeal.value.name ?? '',
              style: AppTextStyle.robotoSemibold20.copyWith(
                color: AppColors.secondary
              ),
            ),
            AppSpacing.spacingVertical24,
            Text(
              controller.currentMeal.value.description ?? '',
              style: AppTextStyle.robotoRegular16.copyWith(
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
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              shrinkWrap: true,
              childAspectRatio: 3,
              children: controller.foods.map((food) {
                return PlanItemCard(
                  text: food.name ?? '',
                  image: '',
                  onTap: controller.viewFoodInformation,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}