import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/register_patient_page/register_patient_controller.dart';
import 'package:fitlifebuddy/widgets/dropdowns/single_dropdown.dart';
import 'package:fitlifebuddy/widgets/fields/app_textfield.dart';
import 'package:fitlifebuddy/widgets/fields/datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoForm extends GetView<RegisterPatientController> {
  const PersonalInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.personalInfoFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'register_pacient_title'.tr,
              style: AppTextStyle.robotoSemibold24,
            ),
            AppSpacing.spacingVertical32,
            //mueve lo de arriba
            AppTextField.textField(
              title: 'firstname'.tr,
              controller: controller.firstnameController.value,
              inputType: TextInputType.name,
            ),
            AppSpacing.spacingVertical24,
            AppTextField.textField(
              title: 'lastname'.tr,
              controller: controller.lastnameController.value,
            ),
            AppSpacing.spacingVertical24,
            SingleDropdown(
              title: 'gender'.tr,
              hintText: 'select_a_gender'.tr,
              items: controller.genders,
              onChanged: (value) => controller.onChangedGender(value),
              width: ContainerSize.baseButtonWidth,
            ),
            AppSpacing.spacingVertical24,
            DateTimePicker(
              title: 'birthdate'.tr,
              controller: controller.birtdateController.value,
              onChanged: (value) => controller.onChangeBirthDate(value),
            ),
            AppSpacing.spacingVertical24,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField.numberField(
                  title: 'weight'.tr,
                  controller: controller.weightController.value,
                  suffixText: 'weight_symbol'.tr,
                  width: ContainerSize.baseButtonSmallWidth,
                ),
                AppSpacing.spacingHorizontal24,
                AppTextField.numberField(
                  title: 'height'.tr,
                  controller: controller.heightController.value,
                  suffixText: 'centimeter_symbol'.tr,
                  width: ContainerSize.baseButtonSmallWidth,
                ),
              ],
            ),
            AppSpacing.spacingVertical24,
            AppTextField.numberField(
              title: 'abdominal_perimeter'.tr,
              controller: controller.absPerimeterController.value,
              suffixText: 'centimeter_symbol'.tr,
            ),
            AppSpacing.spacingVertical24,
            AppTextField.emailField(
              title: 'email'.tr,
              controller: controller.emailController.value,
            ),
            AppSpacing.spacingVertical24,
            SingleDropdown(
              title: 'diet_type'.tr,
              hintText: 'select_a_diet_type'.tr,
              items: controller.diettypes,
              onChanged: (value) => controller.onChangedDietType(value),
              width: ContainerSize.baseButtonWidth,
            ),
            AppSpacing.spacingVertical24,
            SingleDropdown(
              title: 'physical_activity'.tr,
              hintText: 'select_a_physical_activity'.tr,
              items: controller.physicalactivities,
              onChanged: (value) => controller.onChangedPhysicalActivity(value),
              width: ContainerSize.baseButtonWidth,
            ),
          ],
        ),
      ),
    );
  }
}