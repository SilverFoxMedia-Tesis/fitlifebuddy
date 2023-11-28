import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              AppSpacing.spacingVerticalXxl,
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
                  Row(
                    children: [
                      SizedBox(
                        height: 498,
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Desayuno',
                                style: AppTextStyle.robotoSemibold24.copyWith(
                                  color: AppColors.secondary,
                                ),
                              ),
                              AppSpacing.spacingVerticalXxl,
                              PlanItemCard(
                                text: 'Tostada con palta y huevo', 
                                image: AppIcons.meal1,
                                onTap: () => Get.toNamed(AppRoutes.meal),
                              ),
                              AppSpacing.spacingVerticalXxl,
                              Text(
                                'Almuerzo',
                                style: AppTextStyle.robotoSemibold24.copyWith(
                                  color: AppColors.secondary,
                                ),
                              ),
                              AppSpacing.spacingVerticalXxl,
                              const PlanItemCard(text: 'Verduras y pollo al vapor', image: AppIcons.meal2),
                              AppSpacing.spacingVerticalXxl,
                              Text(
                                'Cena',
                                style: AppTextStyle.robotoSemibold24.copyWith(
                                  color: AppColors.secondary,
                                ),
                              ),
                              AppSpacing.spacingVerticalXxl,
                              const PlanItemCard(text: 'Chuleta asada con verduras', image: AppIcons.meal4),
                          ],
                          ),
                        ),
                      ),
                      AppSpacing.spacingHorizontalXxxl,
                      SizedBox(
                        height: 498,
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () => Get.toNamed(AppRoutes.routine),
                                child: Text(
                                  'Rutina de ejercicios',
                                  style: AppTextStyle.robotoSemibold24.copyWith(
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ),
                              AppSpacing.spacingVerticalXxl,
                              const PlanItemCard(text: 'Ejercicio 1', description: '4 x 60 s', image: AppIcons.exercise1),
                              AppSpacing.spacingVerticalXxl,
                              AppSpacing.spacingVerticalXxl,
                              const PlanItemCard(text: 'Ejercicio 2', description: '5 x 60 s', image: AppIcons.exercise2),
                              AppSpacing.spacingVerticalXxl,
                              AppSpacing.spacingVerticalXxl,
                              const PlanItemCard(text: 'Ejercicio 3', description: '6 x 60 s', image: AppIcons.exercise3),
                          ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}