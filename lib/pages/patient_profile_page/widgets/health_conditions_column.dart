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

class HealthConditionsColumn extends GetView<PatientProfileController> {
  const HealthConditionsColumn({
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
                'health_conditions'.tr,
                style: AppTextStyle.robotoSemibold16.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              AppSpacing.spacingHorizontal14,
              Obx(
                () => AppIconButton(
                  iconData: Icons.edit_rounded, 
                  onTap: controller.onEditHealthConditionsPressed,
                  enabled: !controller.isEditing,
                ),
              )
            ],
          ),
          if (controller.hasHealthConditions)
            Form(
              key: controller.healthConditionsFormKey,
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
                            items: controller.healthConditionTypes,
                            selectedValue: controller.healthConditionTypeSelectedValues[index],
                            onChanged: (value) => controller.onChangedHealthCondition(index, value),
                            enabled: controller.isHealthConditionsEditing.value,
                          ),
                          AppSpacing.spacingHorizontal14,
                          AppTextfield(
                            controller: controller.healthConditionTypeSelectedControllers[index],
                            enabled: controller.isHealthConditionsEditing.value,
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
          if (!controller.hasHealthConditions)
            Padding(
              padding: AppPadding.paddingOnlyTop24,
              child: Text(
                'no_health_conditions'.tr,
                style: AppTextStyle.robotoMedium14.copyWith(
                  color: AppColors.secondary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}