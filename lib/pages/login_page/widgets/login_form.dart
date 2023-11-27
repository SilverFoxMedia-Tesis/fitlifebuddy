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
          'Completa tus datos',
          style: AppTextStyle.robotoSemibold20.copyWith(
            color: AppColors.secondary,
          ),
        ),
        AppSpacing.spacingVerticalXxl,
        const AppTextfield(
          title: 'Correo electrónico',
        ),
        AppSpacing.spacingVerticalXxl,
        const AppTextfield(
          title: 'Contraseña',
          isPassword: true,
        ),
        AppSpacing.spacingVerticalXxl,
        InkWell(
          onTap: () => Get.toNamed(AppRoutes.recoverPassword),
          child: Text(
            'Olvidaste tu contraseña?',
            style: AppTextStyle.robotoMedium14.copyWith(
              color: AppColors.secondary,
            ),
          ),
        ),
        AppSpacing.spacingVerticalXxl,
        BaseButtom(
          text: 'Iniciar sesión',
          onTap: () => Get.toNamed(AppRoutes.pacientHome),
        ),
      ],
    );
  }
}