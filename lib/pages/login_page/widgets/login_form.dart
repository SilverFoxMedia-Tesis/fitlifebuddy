import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/login_page/login_controller.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:fitlifebuddy/widgets/buttons/button_size.dart';
import 'package:fitlifebuddy/widgets/fields/app_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppPadding.padding16,
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.logo,
              width: ContainerSize.logoSize,
            ),
            AppSpacing.spacingVertical24,
            Text(
              'complete_data'.tr,
              style: AppTextStyle.robotoSemibold20,
            ),
            AppSpacing.spacingVertical24,
            AppTextField.emailField(
              title: 'email'.tr,
              controller: controller.emailController.value,
            ),
            AppSpacing.spacingVertical24,
            Obx(
              () => AppTextField.passwordField(
                title: 'password'.tr,
                controller: controller.passwordController.value,
                obscureText: controller.obscurePassword.value,
                onSuffixIconPressed: controller.setObscurePassword,
              ),
            ),
            AppSpacing.spacingVertical24,
            _buildForgotPasswordButton(),
            AppSpacing.spacingVertical24,
            Obx(
              () => BaseButton(
                text: 'login'.tr,
                size: ButtonSize.large,
                loading: controller.loading.value,
                onTap: () async => await controller.login(),
              ),
            ),
            AppSpacing.spacingVertical24,
            _buildRegisterButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.recoverPassword),
      child: Text(
        'forgot_password'.tr,
        style: AppTextStyle.robotoMedium14,
      ),
    );
  }

  Widget _buildRegisterButton() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${'no_have_an_account_yet'.tr} ',
            style: AppTextStyle.robotoMedium14,
          ),
          TextSpan(
            text: 'register'.tr,
            style: AppTextStyle.robotoMedium14.copyWith(
              color: Colors.blueAccent,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Get.toNamed(AppRoutes.registerPatient),
          ),
        ],
      ),
    );
  }
}