import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/wrapper/border_radius_wrapper.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
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
        borderRadius: BorderRadiusWrapper.borderRadiusXl,
        boxShadow: [AppBoxShadows.secondary25Blur8],
      ),
      child: Column(
        children: [
          Text(
            'Selecciona un ejercicio',
            style: AppTextStyle.robotoSemibold24.copyWith(
              color: AppColors.secondary,
            ),
          ),
          AppSpacing.spacingVerticalXl,
          Column(
            children: [
              const PlanItemCard(
                text: 'Ejercicio 4', 
                image: AppIcons.exercise4,
              ),
              AppSpacing.spacingVerticalXl,
              const PlanItemCard(
                text: 'Ejercicio 5', 
                image: AppIcons.exercise5,
              ),
              AppSpacing.spacingVerticalXl,
              const PlanItemCard(
                text: 'Ejercicio 6', 
                image: AppIcons.exercise6,
              ),
              AppSpacing.spacingVerticalXl,
              BaseButtom(
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