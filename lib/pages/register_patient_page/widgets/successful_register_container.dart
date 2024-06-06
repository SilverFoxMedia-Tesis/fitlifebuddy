import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/register_patient_page/register_patient_controller.dart';
import 'package:fitlifebuddy/widgets/app_textfield.dart/app_textfield.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccesfulRegisterContainer extends GetView<RegisterPatientController> {
  const SuccesfulRegisterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.paddingPage2,
      child: Column(
        children: [
          Text(
            'successful_registration'.tr,
            style: AppTextStyle.robotoSemibold34,
          ),
          AppSpacing.spacingVertical24,
          SizedBox(
            width: ContainerSize.baseContainerdWidth,
            child: Text(
              'successful_registration_descripction'.tr,
              style: AppTextStyle.robotoSemibold14,
            ),
          ),
          AppSpacing.spacingVertical24,
          AppTextfield(
            title: 'email'.tr,
            hintText: controller.currentPatient.value.person?.emailAddress ?? 'btrbrhrhr',
            suffixIcon: Icons.copy,
            onSuffixIconPressed: controller.copyEmail,
          ),
          AppSpacing.spacingVertical24,
          AppTextfield(
            title: 'password'.tr,
            hintText: controller.currentPatient.value.person?.password ?? 'oigjorigjr',
            suffixIcon: Icons.copy,
            onSuffixIconPressed: controller.copyPassword,
          ),
          AppSpacing.spacingVertical24,
          SizedBox(
            width: ContainerSize.baseContainerdWidth,
            child: Text(
              'successful_registration_warning'.tr,
              style: AppTextStyle.robotoSemibold14.copyWith(
                color: AppColors.danger,
              ),
            ),
          ),
          AppSpacing.spacingVertical24,
          BaseButton(
            text: 'go_to_login'.tr,
            onTap: controller.goToLogin,
          ),
        ],
      ),
    );
  }
}