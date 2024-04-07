import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_textfield.dart/app_textfield.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.paddingPage2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Cuéntanos más sobre el paciente!',
                style: AppTextStyle.robotoSemibold24.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              AppSpacing.spacingVertical24,
              const AppTextfield(
                title: 'Nombre',
              ),
              AppSpacing.spacingVertical24,
              const AppTextfield(
                title: 'Apellido',
              ),
              AppSpacing.spacingVertical24,
              const AppTextfield(
                title: 'Género',
              ),
              AppSpacing.spacingVertical24,
              const AppTextfield(
                title: 'Fecha de nacimiento',
              ),
              AppSpacing.spacingVertical24,
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextfield(
                    title: 'Peso',
                    suffixText: 'kg',
                    width: 162,
                  ),
                  AppSpacing.spacingHorizontal24,
                  AppTextfield(
                    title: 'Altura',
                    suffixText: 'cm',
                    width: 162,
                  ),
                ],
              ),
              AppSpacing.spacingVertical24,
              const AppTextfield(
                title: 'Correo electrónico',
              ),
            ],
          ),
          BaseButtom(
            width: 160,
            text: 'Continuar',
            onTap: () => Get.toNamed(AppRoutes.successfulRegister),
          ),
        ],
      ),
    );
  }
}