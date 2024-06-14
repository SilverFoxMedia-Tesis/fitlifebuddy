import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/settings_page/settings_controller.dart';
import 'package:fitlifebuddy/pages/settings_page/widgets/email_notification.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:fitlifebuddy/widgets/custom_bar/custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: Padding(
        padding: AppPadding.paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.spacingVertical24,
            buildCustomBar(),
            AppSpacing.spacingVertical24,
            const Column(
              children: [
                EmailNotifications(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomBar() {
    return CustomBar(
      title: 'settings'.tr,
      actions: [
        Obx(
          () => BaseButton(
            text: "save".tr,
            loading: controller.loading.value,
            onTap:() async => await controller.saveSettings(),
          ),
        ),
      ],
    );
  }
}