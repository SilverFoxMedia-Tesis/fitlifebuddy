import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';

class ChangeMealCard extends StatelessWidget {
  const ChangeMealCard({super.key});

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
            'Selecciona una comida',
            style: AppTextStyle.robotoSemibold24.copyWith(
              color: AppColors.secondary,
            ),
          ),
          AppSpacing.spacingVertical20,
          Column(
            children: [
              const PlanItemCard(
                text: 'Comida 4',
              ),
              AppSpacing.spacingVertical20,
              const PlanItemCard(
                text: 'Comida 5',
              ),
              AppSpacing.spacingVertical20,
              const PlanItemCard(
                text: 'Comida 6',
              ),
              AppSpacing.spacingVertical20,
              BaseButton(
                text: 'Cambiar comida',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}