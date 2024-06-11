import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/domain/enum/health_risk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthRiskDialog extends StatelessWidget{
  final HealthRisk healthRisk;

  const HealthRiskDialog({
    required this.healthRisk,
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
            children: [
              Text(
                "health_risk_title".tr,
                style: AppTextStyle.robotoSemibold20,
              ),
              AppSpacing.spacingVertical20,
              _buildHealthRiskResult(),
              AppSpacing.spacingVertical20,
              Text(
                "health_risk_description".tr,
                style: AppTextStyle.robotoRegular14,
              ),
              AppSpacing.spacingVertical20,
              Text(
                "go_to_the_doctor".tr,
                style: AppTextStyle.robotoMedium14.copyWith(
                  color: AppColors.danger,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHealthRiskResult() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${'your_health_risk_is'.tr} ',
            style: AppTextStyle.robotoRegular16,
          ),
          TextSpan(
            text: healthRisk.name.toUpperCase(),
            style: AppTextStyle.robotoSemibold16.copyWith(
              color: healthRisk == HealthRisk.high
                ? AppColors.warning
                : AppColors.danger,
            ),
          ),
        ],
      ),
    );
  }
}