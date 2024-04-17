import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/core/utils/input_formatters.dart';
import 'package:fitlifebuddy/core/utils/input_validator.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/patient_profile_controller.dart';
import 'package:fitlifebuddy/widgets/app_dropdown/app_dropdown.dart';
import 'package:fitlifebuddy/widgets/app_icon_button/app_icon_button.dart';
import 'package:fitlifebuddy/widgets/app_textfield.dart/app_textfield.dart';
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
                style: AppTextStyle.robotoSemibold16.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              AppSpacing.spacingHorizontal14,
              Obx(
                () => AppIconButton(
                  iconData: Icons.edit_rounded,
                  onTap: controller.onEditFoodConditionsPressed,
                  enabled: !controller.isEditing,
                ),
              ),
            ],
          ),
          if (controller.hasFoodConditions)
            Form(
              key: controller.foodConditionsFormKey,
              child: Column(
                children: List.generate(
                  controller.currentFoodConditions.length, (index) {
                    return Padding(
                      padding: AppPadding.paddingOnlyTop24,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppDropdown(
                            hintText: 'select_a_condition'.tr,
                            items: controller.foodConditionTypes,
                            selectedValue: controller.foodConditionTypeSelectedValues[index],
                            onChanged: (value) => controller.onChangedFoodCondition(index, value),
                            enabled: controller.isFoodConditionsEditing.value,
                          ),
                          AppSpacing.spacingHorizontal14,
                          AppTextfield(
                            controller: controller.foodConditionTypeSelectedControllers[index],
                            enabled: controller.isFoodConditionsEditing.value,
                            validator: validateLettersOnly,
                            inputFormatters: InputFormatters.lettersOnly,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          if (!controller.hasFoodConditions)
            Text(
              'no_food_conditions'.tr,
              style: AppTextStyle.robotoMedium14.copyWith(
                color: AppColors.secondary,
              ),
            ),
        ],
      ),
    );
  }
}