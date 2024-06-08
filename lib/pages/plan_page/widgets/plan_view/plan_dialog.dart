import 'package:fitlifebuddy/pages/plan_page/plan_controller.dart';
import 'package:fitlifebuddy/widgets/app_dialog/app_dialog.dart';
import 'package:fitlifebuddy/widgets/app_dropdown/single_dropdown.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanDialog extends GetView<PlanController> {
  final bool isEdit;

  const PlanDialog({
    required this.isEdit,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    final text = isEdit ? 'edit_plan'.tr : 'generate_plan'.tr;
    return AppDialog(
      title: text,
      description: 'select_a_frecuency'.tr,
      onClose: controller.onDialogClose,
      extraContent: SingleDropdown(
        items: controller.frequencies,
        onChanged: (value) => controller.onChangeFrecuency(value),
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