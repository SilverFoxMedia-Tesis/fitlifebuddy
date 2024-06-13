import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/patient_profile_controller.dart';
import 'package:fitlifebuddy/widgets/app_dialog/app_dialog.dart';
import 'package:fitlifebuddy/widgets/app_dropdown/multi_dropdown.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditHealthConditionsDialog extends GetView<PatientProfileController> {
  const EditHealthConditionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'edit_health_conditions'.tr,
      extraContent: Column(
        children: [
          MultiDropdown(
            controller: controller.surgeriesController.value,
            title: 'surgeries'.tr,
            hintText: '${'select'.tr} ${'surgeries'.tr.toLowerCase()}',
            items: controller.surgeries,
          ),
          AppSpacing.spacingVertical24,
          MultiDropdown(
            controller: controller.illnessesController.value,
            title: 'illnesses'.tr,
            hintText: '${'select'.tr} ${'illnesses'.tr.toLowerCase()}',
            items: controller.illnesses,
          ),
        ],
      ),
      actions: [
        Obx(
          () => BaseButton(
            text: 'save'.tr,
            loading: controller.isHealthCUpdating.value,
            onTap: () async => await controller.updateHealthConditions(),
            disabled: true,
          ),
        ),
      ],
    );
  }
}