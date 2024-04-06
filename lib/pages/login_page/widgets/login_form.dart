import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:fitlifebuddy/core/utils/input_validator.dart';
import 'package:fitlifebuddy/pages/login_page/login_controller.dart';
import 'package:fitlifebuddy/widgets/app_bar/logo_button.dart';
import 'package:fitlifebuddy/widgets/app_textfield.dart/app_textfield.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Column(
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
          Obx(
            () => AppTextfield(
              title: 'email'.tr,
              controller: controller.emailController.value,
              validator: validateRequiredEmail,
              inputType: TextInputType.emailAddress,
            ),
          ),
          AppSpacing.spacingVerticalXxl,
          Obx(
            () => AppTextfield(
              title: 'password'.tr,
              controller: controller.passwordController.value,
              validator: validatePassword,
              suffixIcon: controller.obscurePassword.value
                ? Icons.remove_red_eye_rounded
                : Icons.visibility_off_rounded,
              onSuffixIconPressed: controller.setObscurePassword,
              obscureText: controller.obscurePassword.value,
            ),
          ),
          AppSpacing.spacingVerticalXxl,
          InkWell(
            onTap: controller.forgotPassword,
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
            onTap: controller.login,
          ),
        ],
      ),
    );
  }
}