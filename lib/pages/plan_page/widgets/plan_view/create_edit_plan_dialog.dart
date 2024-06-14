import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/pages/plan_page/plan_controller.dart';
import 'package:fitlifebuddy/widgets/app_dialog/app_dialog.dart';
import 'package:fitlifebuddy/widgets/dropdowns/single_dropdown.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEditPlanDialog extends GetView<PlanController> {
  final bool isEdit;

  const CreateEditPlanDialog({
    required this.isEdit,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    final text = isEdit ? 'edit_plan'.tr : 'generate_plan'.tr;
    return AppDialog(
      title: text,
      onClose: controller.onDialogClose,
      extraContent: Form(
        key: controller.planFormKey,
        child: Column(
          children: [
            SingleDropdown(
              title: 'frequency'.tr,
              hintText: '${'select'.tr} ${'frequency'.tr.toLowerCase()}',
              initialItem: controller.selectedFrequency != '' ? controller.selectedFrequency : null,
              items: controller.frequencies,
              onChanged: (value) => controller.onChangeFrecuency(value),
            ),
            AppSpacing.spacingVertical24,
            SingleDropdown(
              title: 'goal'.tr,
              hintText: '${'select'.tr} ${'goal'.tr.toLowerCase()}',
              initialItem: controller.selectedGoalType != '' ? controller.selectedGoalType : null,
              items: controller.goaltypes,
              onChanged: (value) => controller.onchangeGoalType(value),
            ),
          ],
        ),
      ),
      actions: [
        Obx(
          () => BaseButton(
            text: text,
            onTap: () async => await controller.createEditPlan(isEdit),
            loading: controller.planLoading.value,
          ),
        ),
      ],
    );
  }
}