import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/patients_page/widgets/data_table.dart';
import 'package:flutter/material.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.paddingPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.spacingVerticalXxl,
              AppSpacing.spacingVerticalXxl,
              Text(
                'Mis pacientes',
                style: AppTextStyle.robotoSemibold32.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              AppSpacing.spacingVerticalXl,
              AppSpacing.spacingVerticalXl,
              const Expanded(
                child: SizedBox(
                  width: 1200,
                  child: PatientsDataTable()
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}