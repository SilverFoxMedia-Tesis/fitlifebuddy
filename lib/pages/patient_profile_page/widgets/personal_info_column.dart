import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/core/utils/input_formatters.dart';
import 'package:fitlifebuddy/core/utils/input_validator.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/patient_profile_controller.dart';
import 'package:fitlifebuddy/widgets/app_dropdown/app_dropdown.dart';
import 'package:fitlifebuddy/widgets/app_icon_button/app_icon_button.dart';
import 'package:fitlifebuddy/widgets/app_textfield.dart/app_textfield.dart';
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
                  style: AppTextStyle.robotoSemibold16.copyWith(
                    color: AppColors.secondary,
                  ),
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
            AppTextfield(
              title: 'firstname'.tr,
              controller: controller.firstnameController.value,
              enabled: controller.isPersonalInfoEditing.value,
              inputType: TextInputType.name,
              validator: validateLettersOnly,
              inputFormatters: InputFormatters.lettersOnly,
            ),
            AppSpacing.spacingVertical24,
            AppTextfield(
              title: 'lastname'.tr,
              controller: controller.lastnameController.value,
              enabled: controller.isPersonalInfoEditing.value,
              validator: validateLettersOnly,
              inputFormatters: InputFormatters.lettersOnly,
            ),
            AppSpacing.spacingVertical24,
            AppDropdown(
              title: 'gender'.tr,
              hintText: 'select_a_gender'.tr,
              items: controller.genders,
              selectedValue: controller.genderSelectedValue.value,
              onChanged: (value) => controller.onChangedGender(value),
              enabled: controller.isPersonalInfoEditing.value,
              width: ContainerSize.baseDropdownWidth,
            ),
            AppSpacing.spacingVertical24,
            AppTextfield(
              title: 'birthdate'.tr,
              controller: controller.birthdateController.value,
              enabled: controller.isPersonalInfoEditing.value,
              inputType: TextInputType.datetime,
              onTap: controller.onTapDateTime,
            ),
            AppSpacing.spacingVertical24,
            Row(
              children: [
                AppTextfield(
                  width: ContainerSize.baseButtonSmallWidth,
                  title: 'weight'.tr,
                  controller: controller.weightController.value,
                  suffixText: 'weight_symbol'.tr,
                  enabled: controller.isPersonalInfoEditing.value,
                  inputType: TextInputType.number,
                  validator: validateNumbersOnly,
                  inputFormatters: InputFormatters.numbersOnly,
                ),
                AppSpacing.spacingHorizontal24,
                AppTextfield(
                  width:  ContainerSize.baseButtonSmallWidth,
                  title: 'height'.tr,
                  controller: controller.heightController.value,
                  suffixText: 'height_symbol'.tr,
                  enabled: controller.isPersonalInfoEditing.value,
                  inputType: TextInputType.number,
                  validator: validateNumbersOnly,
                  inputFormatters: InputFormatters.numbersOnly,
                ),
              ],
            ),
            AppSpacing.spacingVertical24,
            AppTextfield(
              title: 'email'.tr,
              controller: controller.emailController.value,
              enabled: controller.isPersonalInfoEditing.value,
              inputType: TextInputType.emailAddress,
              validator: validateEmail,
              inputFormatters: InputFormatters.emailFormat,
            ),
          ],
        ),
      ),
    );
  }
}