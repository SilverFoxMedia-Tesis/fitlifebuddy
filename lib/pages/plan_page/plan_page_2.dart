import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:flutter/material.dart';

class PlanPage2 extends StatelessWidget {
  const PlanPage2({super.key});

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
                'Mi plan actual',
                style: AppTextStyle.robotoSemibold32.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppIcons.days,
                    width: 1200,
                  ),
                  AppSpacing.spacingVerticalXxxl,
                  Text(
                    'Miércoles, 15 de Noviembre',
                    style: AppTextStyle.robotoSemibold24.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  AppSpacing.spacingVerticalXxxl,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Desayuno',
                        style: AppTextStyle.robotoSemibold24.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                      AppSpacing.spacingVerticalXxl,
                      Image.asset(
                        AppIcons.card,
                        width: 400,
                      ),
                      AppSpacing.spacingVerticalXxl,
                      Text(
                        'Almuerzo',
                        style: AppTextStyle.robotoSemibold24.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                      AppSpacing.spacingVerticalXxl,
                      Image.asset(
                        AppIcons.card2,
                        width: 400,
                      ),
                  ],
                )
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}