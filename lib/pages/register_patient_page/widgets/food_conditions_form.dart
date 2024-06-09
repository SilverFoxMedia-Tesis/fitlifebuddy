import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/register_patient_page/register_patient_controller.dart';
import 'package:fitlifebuddy/widgets/app_dropdown/multi_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodConditionsForm extends GetView<RegisterPatientController> {
  const FoodConditionsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'register_pacient_title'.tr,
            style: AppTextStyle.robotoSemibold24,
          ),
          AppSpacing.spacingVertical32,
          Text(
            'register_pacient_3_title'.tr,
            style: AppTextStyle.robotoSemibold16,
          ),
          AppSpacing.spacingVertical24,
          MultiDropdown(
            controller: controller.preferencesController.value,
            title: 'preferences'.tr,
            hintText: '${'select'.tr} ${'preferences'.tr.toLowerCase()}',
            items: controller.preferences,
            width: ContainerSize.baseButtonWidth,
          ),
          AppSpacing.spacingVertical24,
          MultiDropdown(
            controller: controller.restrictionsController.value,
            title: 'restrictions'.tr,
            hintText: '${'select'.tr} ${'restrictions'.tr.toLowerCase()}',
            items: controller.restrictions,
            width: ContainerSize.baseButtonWidth,
          ),
          AppSpacing.spacingVertical24,
          MultiDropdown(
            controller: controller.allergiesController.value,
            title: 'allergies'.tr,
            hintText: '${'select'.tr} ${'allergies'.tr.toLowerCase()}',
            items: controller.allergies,
            width: ContainerSize.baseButtonWidth,
          ),
        ],
      ),
    );
  }
}