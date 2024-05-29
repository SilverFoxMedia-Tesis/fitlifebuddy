import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/domain/enum/time_meal.dart';
import 'package:fitlifebuddy/pages/plan_page/dummy_data.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final lists = {
    TimeMeal.breakfast: dMealsBreakfast,
    TimeMeal.lunch: dMealsLunch,
    TimeMeal.dinner: dMealsDinner,
  };

class ChangeMealCard extends StatelessWidget {
  final TimeMeal? timeMeal;
  const ChangeMealCard({
    this.timeMeal = TimeMeal.breakfast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final list = lists[timeMeal];
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
            'select_a_meal'.tr,
            style: AppTextStyle.robotoSemibold24.copyWith(
              color: AppColors.secondary,
            ),
          ),
          AppSpacing.spacingVertical20,
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: list?.length,
              itemBuilder: (context, index) {
                final meal = list?[index];
                return Column(
                  children: [
                    PlanItemCard(
                      text: meal?.getName() ?? '',
                      image: meal?.foods?.first.imageUrl,
                    ),
                    AppSpacing.spacingVertical20,
                  ],
                );
              },
            ),
          ),
          BaseButton(
            text: 'edit_food'.tr,
            onTap: () {},
          )
        ],
      ),
    );
  }
}