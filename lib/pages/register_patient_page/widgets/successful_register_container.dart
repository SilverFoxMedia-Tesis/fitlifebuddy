import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/register_patient_page/register_patient_controller.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:fitlifebuddy/widgets/text_container/text_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccesfulRegisterContainer extends GetView<RegisterPatientController> {
  const SuccesfulRegisterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppPadding.padding16,
      child: Column(
        children: [
          Text(
            'successful_registration'.tr,
            style: AppTextStyle.robotoSemibold34,
          ),
          AppSpacing.spacingVertical24,
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: ContainerSize.baseContainerdWidth),
            child: Text(
              'successful_registration_descripction'.tr,
              style: AppTextStyle.robotoSemibold14,
            ),
          ),
          AppSpacing.spacingVertical24,
          buildField(
            'email'.tr,
            controller.currentPatient.value.person?.emailAddress ?? '',
          ),
          AppSpacing.spacingVertical24,
          buildField(
            'password'.tr,
            controller.currentPatient.value.person?.password ?? '',
          ),
          AppSpacing.spacingVertical24,
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: ContainerSize.baseContainerdWidth),
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
            onTap: () => Get.offAllNamed(AppRoutes.login),
          ),
        ],
      ),
    );
  }

  Widget buildField(String title, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.robotoMedium14,
        ),
        AppSpacing.spacingVertical14,
        TextContainer(
          text: value,
          icon: Icons.copy,
          onIconPressed: () => controller.copy(value),
        ),
      ],
    );
  }
}