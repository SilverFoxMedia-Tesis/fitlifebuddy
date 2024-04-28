import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';

class ChangeExerciseCard extends StatelessWidget {
  const ChangeExerciseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 463,
      height: 755,
      padding: AppPadding.paddingDialog,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.borderRadiusXl,
        boxShadow: [AppBoxShadow.secondary25Blur8],
      ),
      child: Column(
        children: [
          Text(
            'Selecciona un ejercicio',
            style: AppTextStyle.robotoSemibold24.copyWith(
              color: AppColors.secondary,
            ),
          ),
          AppSpacing.spacingVertical20,
          Column(
            children: [
              const PlanItemCard(
                text: 'Ejercicio 4', 
                image: AppIcons.exercise4,
              ),
              AppSpacing.spacingVertical20,
              const PlanItemCard(
                text: 'Ejercicio 5', 
                image: AppIcons.exercise5,
              ),
              AppSpacing.spacingVertical20,
              const PlanItemCard(
                text: 'Ejercicio 6', 
                image: AppIcons.exercise6,
              ),
              AppSpacing.spacingVertical20,
              BaseButton(
                text: 'Cambiar ejercicio',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}