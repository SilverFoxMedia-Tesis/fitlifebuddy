import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/register_patient_page/register_patient_controller.dart';
import 'package:fitlifebuddy/widgets/app_dropdown/multi_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthConditionsForm extends GetView<RegisterPatientController> {
  const HealthConditionsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'register_pacient_title'.tr,
          style: AppTextStyle.robotoSemibold24,
        ),
        AppSpacing.spacingVertical32,
        Text(
          'register_pacient_2_title'.tr,
          style: AppTextStyle.robotoSemibold16,
        ),
        AppSpacing.spacingVertical24,
        MultiDropdown(
          controller: controller.surgeriesController.value,
          title: 'Cirugias',
          hintText: 'Seleccionar cirugias',
          items: controller.surgeries,
          width: ContainerSize.baseButtonWidth,
        ),
        AppSpacing.spacingVertical24,
        MultiDropdown(
          controller: controller.illnessesController.value,
          title: 'Enfermedades',
          hintText: 'Seleccionar enfermedades',
          items: controller.illnesses,
          width: ContainerSize.baseButtonWidth,
        ),
      ],
    );
  }
}