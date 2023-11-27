import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:fitlifebuddy/widgets/app_dropdown/app_dropdown.dart';
import 'package:flutter/material.dart';

class FoodConditionsColumn extends StatelessWidget {
  const FoodConditionsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              'Condiciones alimentarias',
              style: AppTextStyle.robotoSemibold20.copyWith(
                color: AppColors.secondary,
              ),
            ),
            AppSpacing.spacingHorizontalMd,
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [AppBoxShadows.primary25Blur8],
              ),
              child: const Icon(
                Icons.edit_rounded,
                color: AppColors.white,
                size: 14,
              )
            ),
          ],
        ),
        AppSpacing.spacingVerticalXxl,
        const AppDropdown(type: 2,),
      ],
    );
  }
}