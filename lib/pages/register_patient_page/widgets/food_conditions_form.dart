import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/core/utils/input_formatters.dart';
import 'package:fitlifebuddy/core/utils/input_validator.dart';
import 'package:fitlifebuddy/pages/register_patient_page/register_patient_controller.dart';
import 'package:fitlifebuddy/widgets/app_dropdown/app_dropdown.dart';
import 'package:fitlifebuddy/widgets/app_icon_button/app_icon_button.dart';
import 'package:fitlifebuddy/widgets/app_textfield.dart/app_textfield.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodConditionsForm extends GetView<RegisterPatientController> {
  const FoodConditionsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Obx(
          () => Column(
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
                'register_pacient_3_title'.tr,
                style: AppTextStyle.robotoSemibold16.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              AppSpacing.spacingVertical24,
              _buildNewFoodConditionContainer(),
              if (controller.hasFoodConditions)
              Form(
                key: controller.foodConditionsFormKey,
                child: _buildFoodConditions(),
              ),
            ],
          ),
        ),
        AppSpacing.spacingVertical24,
        BaseButton(
          text: 'finish'.tr,
          onTap: controller.register,
        ),
      ],
    );
  }

  Widget _buildFoodConditions() {
    return Column(
      children: controller.fConditionTypes.keys.map((key) {
        return Padding(
          padding: AppPadding.paddingOnlyTop24,
          child: _buildFoodConditionContainer(key),
        );
      }).toList(),
    );
  }

  Widget _buildFoodConditionContainer(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppDropdown(
          items: controller.fCTypes,
          selectedValue: controller.fConditionTypes[index],
          onChanged: (value) => controller.onChangedFoodCondition(index, value),
        ),
        AppSpacing.spacingHorizontal14,
        Expanded(
          child: AppTextfield(
            controller: controller.fConditionsControllers[index],
            inputType: TextInputType.text,
            validator: validateNotNullOrEmpty,
            inputFormatters: InputFormatters.alphanumericOnly,
          ),
        ),
      ],
    );
  }

  Widget _buildNewFoodConditionContainer() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppDropdown(
          items: controller.fCTypes,
          selectedValue: controller.newfConditionType.value,
          onChanged: (value) => controller.onChangedNewFoodCondition(value),
        ),
        AppSpacing.spacingHorizontal14,
        Expanded(
          child: AppTextfield(
            controller: controller.newFConditionController.value,
            inputType: TextInputType.text,
            inputFormatters: InputFormatters.alphanumericOnly,
          ),
        ),
        AppSpacing.spacingHorizontal14,
        AppIconButton(
          iconData: Icons.add,
          onTap: controller.saveFCondition,
        ),
      ],
    );
  }
}