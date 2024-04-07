import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_textfield.dart/app_textfield.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccesfulRegisterContainer extends StatelessWidget {
  const SuccesfulRegisterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.paddingPage2,
      child: Column(
        children: [
          Text(
            'Registro exitoso!',
            style: AppTextStyle.robotoSemibold34.copyWith(
              color: AppColors.secondary,
            ),
          ),
          AppSpacing.spacingVertical24,
          SizedBox(
            width: 348,
            child: Text(
              'El paciente ha sido creada exitosamente. A continuación, encontrarás los detalles de su cuenta:',
              style: AppTextStyle.robotoSemibold14.copyWith(
                color: AppColors.secondary,
              ),
            ),
          ),
          AppSpacing.spacingVertical24,
          const AppTextfield(
            readOnly: true,
            title: 'Correo electrónico',
            hintText: 'example@gmail.com',
          ),
          AppSpacing.spacingVertical24,
          const AppTextfield(
            readOnly: true,
            title: 'Contraseña',
            hintText: '4h6j6kbb24b4',
          ),
          AppSpacing.spacingVertical24,
          SizedBox(
            width: 348,
            child: Text(
              'IMPORTANTE: Hemos generado una contraseña temporal para la cuenta. Indicar al paciente cambiar esta contraseña.',
              style: AppTextStyle.robotoSemibold14.copyWith(
                color: AppColors.danger,
              ),
            ),
          ),
          AppSpacing.spacingVertical24,
          BaseButtom(
          text: 'Ir a Inicio',
          onTap: () => Get.toNamed(AppRoutes.home),
            ),
          
        ],
      ),
    );
  }
}