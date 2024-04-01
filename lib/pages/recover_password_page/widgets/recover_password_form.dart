import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
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
        Text(
          'Recuperar contraseña',
          style: AppTextStyle.robotoSemibold34.copyWith(
            color: AppColors.secondary,
          ),
        ),
        AppSpacing.spacingVerticalXxl,
        SizedBox(
          width: 348,
          child: Text(
            'Ingresa el correo electrónico que utilizaste para registrarte y nosotros te enviaremos las instrucciones para recuperar tu contraseña.',
            style: AppTextStyle.robotoSemibold14.copyWith(
              color: AppColors.secondary,
            ),
          ),
        ),
        AppSpacing.spacingVerticalXxl,
        const AppTextfield(
          title: 'Correo electrónico',
        ),
        AppSpacing.spacingVerticalXxl,
        BaseButtom(
          text: 'Recuperar contraseña',
          onTap: () => Get.toNamed(AppRoutes.login),
        ),
      ],
    );
  }
}