import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/patients_page/widgets/data_table.dart';
import 'package:flutter/material.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: const Scaffold(
        body: Padding(
          padding: AppPadding.paddingPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.spacingVertical24,
              AppSpacing.spacingVertical24,
              Text(
                'Mis pacientes',
                style: AppTextStyle.robotoSemibold34,
              ),
              AppSpacing.spacingVertical20,
              AppSpacing.spacingVertical20,
              Expanded(
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