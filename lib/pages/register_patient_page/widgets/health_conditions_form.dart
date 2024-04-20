import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/core/utils/input_formatters.dart';
import 'package:fitlifebuddy/core/utils/input_validator.dart';
import 'package:fitlifebuddy/pages/register_patient_page/register_patient_controller.dart';
import 'package:fitlifebuddy/widgets/app_dropdown/app_dropdown.dart';
import 'package:fitlifebuddy/widgets/app_icon_button/app_icon_button.dart';
import 'package:fitlifebuddy/widgets/app_textfield.dart/app_textfield.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthConditionsForm extends GetView<RegisterPatientController> {
  const HealthConditionsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Obx(
          () => Form(
            key: controller.healthConditionsFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'register_pacient_title'.tr,
                  style: AppTextStyle.robotoSemibold24.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                AppSpacing.spacingVertical32,
                Text(
                  'register_pacient_2_title'.tr,
                  style: AppTextStyle.robotoSemibold16.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                AppSpacing.spacingVertical24,
                _buildNewHealthConditionContainer(),
                if (controller.hConditionTypes.isNotEmpty)
                _buildHealthConditions(),
              ],
            ),
          ),
        ),
        AppSpacing.spacingVertical24,
        BaseButtom(
          width: ContainerSize.baseButtonSmallWidth,
          text: 'continue'.tr,
          onTap: () => controller.onChangedPage(2),
        ),
      ],
    );
  }

  Widget _buildHealthConditions() {
    return Column(
      children: controller.hConditionTypes.keys.map((key) {
        return Padding(
          padding: AppPadding.paddingOnlyTop24,
          child: _buildHealthConditionContainer(key),
        );
      }).toList(),
    );
  }

  Widget _buildHealthConditionContainer(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppDropdown(
          items: controller.hCTypes,
          selectedValue: controller.hConditionTypes[index],
          onChanged: (value) => controller.onChangedHealthCondition(index, value),
        ),
        AppSpacing.spacingHorizontal14,
        Expanded(
          child: AppTextfield(
            controller: controller.hConditionsControllers[index],
            inputType: TextInputType.text,
            validator: validateNotNullOrEmpty,
            inputFormatters: InputFormatters.alphanumericOnly,
          ),
        ),
      ],
    );
  }

  Widget _buildNewHealthConditionContainer() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppDropdown(
          items: controller.hCTypes,
          selectedValue: controller.newhConditionType.value,
          onChanged: (value) => controller.onChangedNewHealthCondition(value),
        ),
        AppSpacing.spacingHorizontal14,
        Expanded(
          child: AppTextfield(
            controller: controller.newHConditionController.value,
            inputType: TextInputType.text,
            validator: validateNotNullOrEmpty,
            inputFormatters: InputFormatters.alphanumericOnly,
          ),
        ),
        AppSpacing.spacingHorizontal14,
        AppIconButton(
          iconData: Icons.add,
          onTap: controller.saveHCondition,
        ),
      ],
    );
  }
}