import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_bar/custom_bar.dart';

class ProgressPage extends GetView {
  const ProgressPage({super.key});

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
          ],
        ),
      ),
    );
  }

  Widget buildCustomBar() {
    return CustomBar(
      title: 'Mi progreso'.tr,
      onBackPressed: () => Get.toNamed(AppRoutes.home),
    );
  }
}