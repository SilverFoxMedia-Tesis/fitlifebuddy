import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/settings_page/settings_controller.dart';
import 'package:fitlifebuddy/widgets/switch/app_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailNotifications extends GetView<SettingsController> {
  const EmailNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'notifications'.tr,
          style: AppTextStyle.robotoSemibold16,
        ),
        AppSpacing.spacingVertical24,
        Obx(
          () => AppSwicth(
            value: controller.emailNotificationEnabled.value,
            onChanged: (value) => controller.setEmailNotificationEnabled(value),
            title: 'email_notifications'.tr,
            subtitle: 'email_notifications_description'.tr,
            disabled: controller.loading.value,
          ),
        ),
      ],
    );
  }
}