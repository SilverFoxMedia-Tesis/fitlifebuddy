import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/core/utils/input_formatters.dart';
import 'package:fitlifebuddy/core/utils/input_validator.dart';
import 'package:fitlifebuddy/pages/register_patient_page/register_patient_controller.dart';
import 'package:fitlifebuddy/widgets/app_dropdown/single_dropdown.dart';
import 'package:fitlifebuddy/widgets/app_textfield.dart/app_textfield.dart';
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
            AppTextfield(
              title: 'firstname'.tr,
              controller: controller.firstnameController.value,
              inputType: TextInputType.name,
              validator: validateLettersOnly,
              inputFormatters: InputFormatters.lettersOnly,
            ),
            AppSpacing.spacingVertical24,
            AppTextfield(
              title: 'lastname'.tr,
              controller: controller.lastnameController.value,
              validator: validateLettersOnly,
              inputFormatters: InputFormatters.lettersOnly,
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
            AppTextfield(
              title: 'birthdate'.tr,
              controller: controller.birthdayController.value,
              inputType: TextInputType.datetime,
              onTap: controller.onTapDateTime,
            ),
            AppSpacing.spacingVertical24,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextfield(
                  width: ContainerSize.baseButtonSmallWidth,
                  title: 'weight'.tr,
                  controller: controller.weightController.value,
                  suffixText: 'weight_symbol'.tr,
                  inputType: TextInputType.number,
                  validator: validateWeightAndHeight,
                  inputFormatters: InputFormatters.numbersOnly,
                ),
                AppSpacing.spacingHorizontal24,
                AppTextfield(
                  width:  ContainerSize.baseButtonSmallWidth,
                  title: 'height'.tr,
                  controller: controller.heightController.value,
                  suffixText: 'centimeter_symbol'.tr,
                  inputType: TextInputType.number,
                  validator: validateWeightAndHeight,
                  inputFormatters: InputFormatters.numbersOnly,
                ),
              ],
            ),
            AppSpacing.spacingVertical24,
            AppTextfield(
              title: 'abdominal_perimeter'.tr,
              controller: controller.absPerimeterController.value,
              suffixText: 'centimeter_symbol'.tr,
              inputType: TextInputType.number,
              validator: validateWeightAndHeight,
              inputFormatters: InputFormatters.numbersOnly,
            ),
            AppSpacing.spacingVertical24,
            AppTextfield(
              title: 'email'.tr,
              controller: controller.emailController.value,
              inputType: TextInputType.emailAddress,
              validator: validateRequiredEmail,
            ),
          ],
        ),
      ),
    );
  }
}