import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
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
            style: AppTextStyle.robotoSemibold32.copyWith(
              color: AppColors.secondary,
            ),
          ),
          AppSpacing.spacingVerticalXxl,
          SizedBox(
            width: 348,
            child: Text(
              'El paciente ha sido creada exitosamente. A continuación, encontrarás los detalles de su cuenta:',
              style: AppTextStyle.robotoSemibold14.copyWith(
                color: AppColors.secondary,
              ),
            ),
          ),
          AppSpacing.spacingVerticalXxl,
          const AppTextfield(
            readOnly: true,
            title: 'Correo electrónico',
            hintText: 'example@gmail.com',
          ),
          AppSpacing.spacingVerticalXxl,
          const AppTextfield(
            readOnly: true,
            title: 'Contraseña',
            hintText: '4h6j6kbb24b4',
          ),
          AppSpacing.spacingVerticalXxl,
          SizedBox(
            width: 348,
            child: Text(
              'IMPORTANTE: Hemos generado una contraseña temporal para la cuenta. Indicar al paciente cambiar esta contraseña.',
              style: AppTextStyle.robotoSemibold14.copyWith(
                color: AppColors.danger,
              ),
            ),
          ),
          AppSpacing.spacingVerticalXxl,
          BaseButtom(
          text: 'Ir a Inicio',
          onTap: () => Get.toNamed(AppRoutes.home),
            ),
          
        ],
      ),
    );
  }
}