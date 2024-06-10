import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/patient_profile_controller.dart';
import 'package:fitlifebuddy/widgets/app_icon_button/app_icon_button.dart';
import 'package:fitlifebuddy/widgets/empty_result/empty_result.dart';
import 'package:fitlifebuddy/widgets/text_container/text_container.dart';
import 'package:fitlifebuddy/widgets/text_container/text_container_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodConditionsColumn extends GetView<PatientProfileController> {
  const FoodConditionsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'food_conditions'.tr,
                style: AppTextStyle.robotoSemibold16,
              ),
              AppSpacing.spacingHorizontal14,
              Obx(
                () => AppIconButton(
                  iconData: Icons.edit_rounded,
                  onTap: () async => await controller.openEditFoodConditionsDialog(),
                  enabled: !controller.isEditing,
                ),
              ),
            ],
          ),
          if (controller.hasFoodConditions)
            buildConditions(),
          if (!controller.hasFoodConditions)
            EmptyResult(message: 'no_food_conditions'.tr),
        ],
      ),
    );
  }

  Column buildConditions() {
    return Column(
      children: List.generate(
        controller.currentFoodConditions.length, (index) {
          return Padding(
            padding: AppPadding.paddingOnlyTop24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextContainer(
                  text: controller.currentFoodConditions[index].type?.label ?? '',
                  style: TextContainerStyle.type2,
                ),
                AppSpacing.spacingHorizontal14,
                TextContainer(
                  text: controller.currentFoodConditions[index].name ?? '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}