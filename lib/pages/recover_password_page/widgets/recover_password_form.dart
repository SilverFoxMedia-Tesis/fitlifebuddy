import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_textfield.dart/app_textfield.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPasswordForm extends StatelessWidget {
  const RecoverPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: ContainerSize.baseContainerdWidth,
          child: Text(
            'recover_password'.tr,
            style: AppTextStyle.robotoSemibold20.copyWith(
              color: AppColors.secondary,
            ),
          ),
        ),
        AppSpacing.spacingVertical24,
        SizedBox(
          width: ContainerSize.baseContainerdWidth,
          child: Text(
            'recover_password_description'.tr,
            style: AppTextStyle.robotoMedium14.copyWith(
              color: AppColors.secondary,
            ),
          ),
        ),
        AppSpacing.spacingVertical24,
        AppTextfield(
          title: 'email'.tr,
        ),
        AppSpacing.spacingVertical24,
        BaseButtom(
          text: 'recover_password'.tr,
          onTap: () => Get.toNamed(AppRoutes.login),
        ),
      ],
    );
  }
}