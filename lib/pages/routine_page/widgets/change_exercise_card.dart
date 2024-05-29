import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/plan_page/dummy_data.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeExerciseCard extends StatelessWidget {
  const ChangeExerciseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 463,
      height: 755,
      padding: AppPadding.paddingDialog,
      decoration: const BoxDecoration(
        color: AppColors.light,
        borderRadius: AppBorderRadius.borderRadiusXl,
        boxShadow: [AppBoxShadow.secondary25Blur8],
      ),
      child: Column(
        children: [
          Text(
            'select_an_exercise'.tr,
            style: AppTextStyle.robotoSemibold24.copyWith(
              color: AppColors.secondary,
            ),
          ),
          AppSpacing.spacingVertical20,
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dExtraExercises.length,
              itemBuilder: (context, index) {
                final exercise = dExtraExercises[index];
                return Column(
                  children: [
                    PlanItemCard(
                      text: exercise.workout ?? '',
                      description: '${exercise.repsPerSet} x ${exercise.sets}',
                      image: exercise.imageUrl,
                    ),
                    AppSpacing.spacingVertical20,
                  ],
                );
              },
            ),
          ),
          BaseButton(
            text: 'edit_exercise'.tr,
            onTap: () {},
          )
        ],
      ),
    );
  }
}