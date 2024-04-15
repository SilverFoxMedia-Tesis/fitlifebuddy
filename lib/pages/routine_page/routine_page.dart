import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/pages/routine_page/widgets/change_exercise_card.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: Padding(
        padding: AppPadding.paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.spacingVertical32,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Rutina |',
                      style: AppTextStyle.robotoSemibold34.copyWith(
                        color: AppColors.secondary
                      ),
                    ),
                    AppSpacing.spacingHorizontal16,
                    Text(
                      'Miércoles, 15 de Noviembre',
                      style: AppTextStyle.robotoRegular34.copyWith(
                        color: AppColors.primary
                      ),
                    ),
                  ],
                ),
                BaseButtom(
                  text: 'Completado',
                  onTap: () {},
                  backgroundColor: AppColors.secondary,
                  width: 160,
                ),
              ],
            ),
            AppSpacing.spacingVertical24,
            Row(
              children: [
                const PlanItemCard(text: 'Ejercicio 1', description: '4 x 60 s', image: AppIcons.exercise1),
                AppSpacing.spacingHorizontal20,
                BaseButtom(
                  text: 'Cambiar',
                  onTap: () {
                    Get.dialog(
                      Dialog(
                        backgroundColor: AppColors.secondary.withOpacity(0.5),
                        child: const ChangeExerciseCard(),
                      ),
                    );
                  },
                  backgroundColor: AppColors.warning,
                  width: 160,
                ),
              ],
            ),
            AppSpacing.spacingVertical20,
            Row(
              children: [
                const PlanItemCard(text: 'Ejercicio 2', description: '5 x 60 s', image: AppIcons.exercise2),
                AppSpacing.spacingHorizontal20,
                BaseButtom(
                  text: 'Cambiar',
                  onTap: () {},
                  backgroundColor: AppColors.warning,
                  width: 160,
                ),
              ],
            ),
            AppSpacing.spacingVertical20,
            Row(
              children: [
                const PlanItemCard(text: 'Ejercicio 3', description: '6 x 60 s', image: AppIcons.exercise3),
                AppSpacing.spacingHorizontal20,
                BaseButtom(
                  text: 'Cambiar',
                  onTap: () {},
                  backgroundColor: AppColors.warning,
                  width: 160,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}