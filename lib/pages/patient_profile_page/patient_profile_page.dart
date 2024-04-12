import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/widgets/food_conditions_column.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/widgets/health_conditions_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            AppSpacing.spacingVertical24,
            Text(
              'my_profile'.tr,
              style: AppTextStyle.robotoSemibold24.copyWith(
                color: AppColors.secondary,
              ),
            ),
            AppSpacing.spacingVertical24,
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PersonalInfo(),
                AppSpacing.spacingHorizontal32,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoodConditionsColumn(),
                    AppSpacing.spacingVertical24,
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
