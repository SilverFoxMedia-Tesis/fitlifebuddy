import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_bar/logo_button.dart';
import 'package:fitlifebuddy/widgets/app_textfield.dart/app_textfield.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LogoButton(
          icon: AppIcons.logo,
          text: '',
          onTap: null,
        ),
        AppSpacing.spacingVerticalXxl,
        Text(
          'complete_data'.tr,
          style: AppTextStyle.robotoSemibold20.copyWith(
            color: AppColors.secondary,
          ),
        ),
        AppSpacing.spacingVerticalXxl,
        AppTextfield(
          title: 'email'.tr,
        ),
        AppSpacing.spacingVerticalXxl,
        AppTextfield(
          title: 'password'.tr,
          suffixIcon: Icons.remove_red_eye_rounded,
          onSuffixIconPressed: () {},
          obscureText: true,
        ),
        AppSpacing.spacingVerticalXxl,
        InkWell(
          onTap: () => Get.toNamed(AppRoutes.recoverPassword),
          child: Text(
            'forgot_password'.tr,
            style: AppTextStyle.robotoMedium14.copyWith(
              color: AppColors.secondary,
            ),
          ),
        ),
        AppSpacing.spacingVerticalXxl,
        BaseButtom(
          text: 'login'.tr,
          onTap: () => Get.toNamed(AppRoutes.home),
        ),
      ],
    );
  }
}