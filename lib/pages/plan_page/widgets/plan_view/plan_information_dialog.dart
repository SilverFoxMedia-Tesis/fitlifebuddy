import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/domain/model/plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanInformationDialog extends StatelessWidget {
  final Plan plan;
  const PlanInformationDialog({
    required this.plan,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: AppColors.light,
      shape: const RoundedRectangleBorder(
        borderRadius: AppBorderRadius.borderRadius14,
      ),
      content: SizedBox(
        width: 400,
        child: Padding(
          padding: AppPadding.paddingDialog,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "plan_info".tr,
                style: AppTextStyle.robotoSemibold20,
              ),
              AppSpacing.spacingVertical8,
              buildTag(
                'tmb'.tr,
                '${plan.tmb} Kcal',
              ),
              AppSpacing.spacingVertical8,
              buildTag(
                'estimated_weight_lose'.tr,
                '${plan.weightLose} Kg',
              ),
              AppSpacing.spacingVertical8,
              buildTag(
                'bmi_category'.tr,
                plan.bmiCategory?.label ?? '',
              ),
              AppSpacing.spacingVertical8,
              buildTag(
                'calorie_deficit'.tr,
                '${plan.calorieDeficit} Kcal',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTag(String name, String description) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppTextStyle.robotoSemibold14,
        ),
        AppSpacing.spacingVertical4,
        Text(
          description,
          style: AppTextStyle.robotoMedium14.copyWith(
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}