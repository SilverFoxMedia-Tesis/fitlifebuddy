import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/patient_profile_controller.dart';
import 'package:fitlifebuddy/widgets/app_dropdown/app_dropdown.dart';
import 'package:fitlifebuddy/widgets/app_icon_button/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthConditionsColumn extends GetView<PatientProfileController> {
  const HealthConditionsColumn({
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
              'health_conditions'.tr,
              style: AppTextStyle.robotoSemibold16.copyWith(
                color: AppColors.secondary,
              ),
            ),
            AppSpacing.spacingHorizontal14,
            Obx(
              () => AppIconButton(
                iconData: Icons.edit_rounded, 
                onTap: controller.onEditHealthConditionsPressed,
                enabled: !controller.isEditing,
              ),
            )
          ],
        ),
        AppSpacing.spacingVertical24,
        const AppDropdown(),
      ],
    );
  }
}