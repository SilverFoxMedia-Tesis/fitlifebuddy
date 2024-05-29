import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/plan_page/plan_controller.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/empty_container.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_view/plan_view.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/buttons/action_severity.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:fitlifebuddy/widgets/custom_bar/custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanPage extends GetView<PlanController> {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: Padding(
        padding: AppPadding.paddingPage,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.spacingVertical24,
              buildCustomBar(),
              AppSpacing.spacingVertical24,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!controller.hasPLan)
                      Center(
                        child: EmptyContainer(
                          text: 'no_plan'.tr, 
                          buttonTitle: 'generate_plan'.tr,
                          onTap: controller.openGeneratePlanDialog,
                        ),
                      ),
                    if (controller.hasPLan)
                      const PlanView(),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }

  Widget buildCustomBar() {
    return CustomBar(
      title: 'my_current_plan'.tr,
      onBackPressed: () => Get.offAllNamed(AppRoutes.home),
      actions: [
        if (controller.hasPLan)
          BaseButton(
            text: "edit_plan".tr,
            actionSeverity: ActionSeverity.warning,
          ),
      ],
    );
  }
}
