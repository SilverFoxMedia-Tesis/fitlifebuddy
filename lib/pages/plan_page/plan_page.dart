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
import 'package:fitlifebuddy/widgets/loading/loading_widget.dart';
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
              Obx(
                () => LoadingWidget(
                  isLoading: controller.loading.value,
                  child: controller.hasPLan
                    ? const PlanView()
                    : Expanded(
                        child: Center(
                          child: EmptyContainer(
                            text: 'no_plan'.tr,
                            buttonTitle: 'generate_plan'.tr,
                            onTap: controller.openCreateEditPlanDialog,
                          ),
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomBar() {
    return CustomBar(
      title: 'my_current_plan'.tr,
      extraTitle: controller.planDates.value,
      onBackPressed: () => Get.toNamed(AppRoutes.home),
      actions: [
        if (controller.hasPLan & !controller.loading.value) ...[
          BaseButton(
            text: "view_plan_info".tr,
            actionSeverity: ActionSeverity.primary,
            onTap:() async => await controller.openViewPlanInfoDialog(),
          ),
          AppSpacing.spacingHorizontal14,
          BaseButton(
            text: "edit_plan".tr,
            actionSeverity: ActionSeverity.warning,
            onTap:() async => await controller.openCreateEditPlanDialog(isEdit: true),
          ),
        ],
      ],
    );
  }
}
