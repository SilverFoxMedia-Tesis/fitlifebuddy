import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/pages/plan_page/plan_controller.dart';
import 'package:fitlifebuddy/widgets/app_dialog/app_dialog.dart';
import 'package:fitlifebuddy/widgets/app_dropdown/app_dropdown.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanDialog extends GetView<PlanController> {
  const PlanDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'close_to_generate_plan'.tr,
      description: 'select_a_frecuency'.tr,
      extraContent: Obx(
        () => AppDropdown(
          items: controller.frequencies,
          selectedValue: controller.frequency.value,
          onChanged: (value) => controller.onChangeFrecuency(value),
          width: ContainerSize.baseTextfieldWidth,
        ),
      ),
      actions: [
        BaseButton(
          text: 'generate_plan'.tr,
          onTap: controller.generatePlan,
        )
      ],
    );
  }
}