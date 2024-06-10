import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/patient_profile_controller.dart';
import 'package:fitlifebuddy/widgets/app_dialog/app_dialog.dart';
import 'package:fitlifebuddy/widgets/app_dropdown/multi_dropdown.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditFoodConditionsDialog extends GetView<PatientProfileController> {
  const EditFoodConditionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'edit_health_conditions'.tr,
      extraContent: Column(
        children: [
          MultiDropdown(
            controller: controller.preferencesController.value,
            title: 'preferences'.tr,
            hintText: '${'select'.tr} ${'preferences'.tr.toLowerCase()}',
            items: controller.preferences,
          ),
          AppSpacing.spacingVertical24,
          MultiDropdown(
            controller: controller.restrictionsController.value,
            title: 'restrictions'.tr,
            hintText: '${'select'.tr} ${'restrictions'.tr.toLowerCase()}',
            items: controller.restrictions,
          ),
          AppSpacing.spacingVertical24,
          MultiDropdown(
            controller: controller.allergiesController.value,
            title: 'allergies'.tr,
            hintText: '${'select'.tr} ${'allergies'.tr.toLowerCase()}',
            items: controller.allergies,
          ),
        ],
      ),
      actions: [
        BaseButton(
          text: 'save'.tr,
          onTap: () async => await controller.updateFoodConditions(),
          disabled: true,
        ),
      ],
    );
  }
}