import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/patient_profile_controller.dart';
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
      () => Column(
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
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [AppBoxShadow.primary25Blur8],
                ),
                child: const Icon(
                  Icons.edit_rounded,
                  color: AppColors.white,
                  size: 14,
                )
              ),
            ],
          ),
          AppSpacing.spacingVertical32,
          AppTextfield(
            title: 'firstname'.tr,
            controller: controller.firstnameController.value,
            readOnly: controller.isEditable.value,
          ),
          AppSpacing.spacingVertical32,
          AppTextfield(
            title: 'lastname'.tr,
            controller: controller.lastnameController.value,
            readOnly: controller.isEditable.value,
          ),
          AppSpacing.spacingVertical32,
          AppTextfield(
            title: 'gender'.tr,
            controller: controller.genderController.value,
            readOnly: controller.isEditable.value,
          ),
          AppSpacing.spacingVertical32,
          AppTextfield(
            title: 'birthdate'.tr,
            controller: controller.birthdateController.value,
            readOnly: controller.isEditable.value,
          ),
          AppSpacing.spacingVertical32,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextfield(
                width: 160,
                title: 'weight'.tr,
                controller: controller.weightController.value,
                suffixText: 'weight_symbol'.tr,
                readOnly: controller.isEditable.value,
              ),
              AppSpacing.spacingHorizontal24,
              AppTextfield(
                width: 160,
                title: 'height'.tr,
                controller: controller.heightController.value,
                suffixText: 'height_symbol'.tr,
                readOnly: controller.isEditable.value,
              ),
            ],
          ),
          AppSpacing.spacingVertical32,
          AppTextfield(
            title: 'email'.tr,
            controller: controller.emailController.value,
            readOnly: controller.isEditable.value,
          ),
        ],
      ),
    );
  }
}