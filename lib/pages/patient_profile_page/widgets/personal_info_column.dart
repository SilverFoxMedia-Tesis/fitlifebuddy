import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/patient_profile_controller.dart';
import 'package:fitlifebuddy/widgets/dropdowns/single_dropdown.dart';
import 'package:fitlifebuddy/widgets/app_icon_button/app_icon_button.dart';
import 'package:fitlifebuddy/widgets/fields/app_textfield.dart';
import 'package:fitlifebuddy/widgets/fields/datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfo extends GetView<PatientProfileController> {
  const PersonalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.personalInfoFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'my_personal_info'.tr,
                  style: AppTextStyle.robotoSemibold16,
                ),
                AppSpacing.spacingHorizontal14,
                AppIconButton(
                  iconData: Icons.edit_rounded,
                  onTap: controller.onEditPersonalInfoPressed,
                  enabled: !controller.isEditing,
                ),
              ],
            ),
            AppSpacing.spacingVertical24,
            AppTextField.textField(
              title: 'firstname'.tr,
              controller: controller.firstnameController.value,
              enabled: controller.isPersonalInfoEditing.value,
              inputType: TextInputType.name,
            ),
            AppSpacing.spacingVertical24,
            AppTextField.textField(
              title: 'lastname'.tr,
              controller: controller.lastnameController.value,
              enabled: controller.isPersonalInfoEditing.value,
            ),
            AppSpacing.spacingVertical24,
            SingleDropdown(
              title: 'gender'.tr,
              hintText: 'select_a_gender'.tr,
              initialItem: controller.currentGender.value,
              items: controller.genders,
              onChanged: (value) => controller.onChangedGender(value),
              enabled: controller.isPersonalInfoEditing.value,
              width: ContainerSize.baseButtonWidth,
            ),
            AppSpacing.spacingVertical24,
            DateTimePicker(
              title: 'birthdate'.tr,
              controller: controller.birthdateController.value,
              initialDate: controller.currentBirthDate.value,
              onChanged: (value) => controller.onChangeBirthDate(value),
              enabled: controller.isPersonalInfoEditing.value,
            ),
            AppSpacing.spacingVertical24,
            Row(
              children: [
                AppTextField.numberField(
                  title: 'weight'.tr,
                  controller: controller.weightController.value,
                  suffixText: 'weight_symbol'.tr,
                  enabled: controller.isPersonalInfoEditing.value,
                  width: ContainerSize.baseButtonSmallWidth,
                ),
                AppSpacing.spacingHorizontal24,
                AppTextField.numberField(
                  title: 'height'.tr,
                  controller: controller.heightController.value,
                  suffixText: 'centimeter_symbol'.tr,
                  enabled: controller.isPersonalInfoEditing.value,
                  width: ContainerSize.baseButtonSmallWidth,
                ),
              ],
            ),
            AppSpacing.spacingVertical24,
            AppTextField.numberField(
              title: 'abdominal_perimeter'.tr,
              controller: controller.absPerimeterController.value,
              suffixText: 'centimeter_symbol'.tr,
              enabled: controller.isPersonalInfoEditing.value,
            ),
            AppSpacing.spacingVertical24,
            AppTextField.emailField(
              title: 'email'.tr,
              controller: controller.emailController.value,
              enabled: controller.isPersonalInfoEditing.value,
            ),
            AppSpacing.spacingVertical24,
            SingleDropdown(
              title: 'diet_type'.tr,
              hintText: 'select_a_diet_type'.tr,
              initialItem: controller.currentDietType.value,
              items: controller.diettypes,
              onChanged: (value) => controller.onChangedDietType(value),
              enabled: controller.isPersonalInfoEditing.value,
              width: ContainerSize.baseButtonWidth,
            ),
            AppSpacing.spacingVertical24,
            SingleDropdown(
              title: 'physical_activity'.tr,
              hintText: 'select_a_physical_activity'.tr,
              initialItem: controller.currentPhysicalActivity.value,
              items: controller.physicalactivities,
              onChanged: (value) => controller.onChangedPhysicalActivity(value),
              enabled: controller.isPersonalInfoEditing.value,
              width: ContainerSize.baseButtonWidth,
            ),
          ],
        ),
      ),
    );
  }
}