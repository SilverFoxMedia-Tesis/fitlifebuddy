import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/widgets/food_conditions_column.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/widgets/health_conditions_column.dart';
import 'package:flutter/material.dart';

import 'widgets/personal_info_column.dart';

class PatientProfilePage extends StatelessWidget {
  const PatientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: Padding(
        padding: AppPadding.paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.spacingVerticalLg,
            AppSpacing.spacingVerticalXxxl,
            Text(
              'Mi perfil',
              style: AppTextStyle.robotoSemibold32.copyWith(
                color: AppColors.secondary,
              ),
            ),
            AppSpacing.spacingVerticalXxxl,
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PersonalInfo(),
                AppSpacing.spacingHorizontalLg,
                AppSpacing.spacingHorizontalXxxl,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoodConditionsColumn(),
                    AppSpacing.spacingVerticalLg,
                    AppSpacing.spacingVerticalXxxl,
                    HealthConditionsColumn(),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
