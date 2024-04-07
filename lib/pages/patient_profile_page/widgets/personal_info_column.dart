import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/widgets/app_textfield.dart/app_textfield.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Mi información personal',
              style: AppTextStyle.robotoSemibold20.copyWith(
                color: AppColors.secondary,
              ),
            ),
            AppSpacing.spacingHorizontal14,
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [AppBoxShadow.primary25Blur8],
              ),
              child: const Icon(
                Icons.edit_rounded,
                color: AppColors.white,
                size: 14,
              )
            ),
          ],
        ),
        AppSpacing.spacingVertical32,
        const AppTextfield(
          title: 'Nombre',
          hintText: 'Mark',
          readOnly: true,
        ),
        AppSpacing.spacingVertical32,
        const AppTextfield(
          title: 'Apellido',
          hintText: 'Smith',
          readOnly: true,
        ),
        AppSpacing.spacingVertical32,
        const AppTextfield(
          title: 'Género',
          hintText: 'Masculino',
          readOnly: true,
        ),
        AppSpacing.spacingVertical32,
        const AppTextfield(
          title: 'Fecha de nacimiento',
          hintText: '01/01/2001',
          readOnly: true,
        ),
        AppSpacing.spacingVertical32,
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextfield(
              width: 160,
              title: 'Peso',
              hintText: '100',
              suffixText: 'kg',
              readOnly: true,
            ),
            AppSpacing.spacingHorizontal24,
            AppTextfield(
              width: 160,
              title: 'Altura',
              hintText: '180',
              suffixText: 'cm',
              readOnly: true,
            ),
          ],
        ),
        AppSpacing.spacingVertical32,
        const AppTextfield(
          title: 'Correo electrónico',
          hintText: 'marksmith@gmail.com',
          readOnly: true,
        ),
      ],
    );
  }
}