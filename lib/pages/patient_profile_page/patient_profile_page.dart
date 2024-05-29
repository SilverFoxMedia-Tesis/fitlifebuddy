import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/patient_profile_controller.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/widgets/food_conditions_column.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/widgets/health_conditions_column.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/buttons/action_severity.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:fitlifebuddy/widgets/custom_bar/custom_bar.dart';
import 'package:fitlifebuddy/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/personal_info_column.dart';

class PatientProfilePage extends GetView<PatientProfileController> {
  const PatientProfilePage({super.key});

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
            Obx(
              () => LoadingWidget(
                isLoading: controller.loading.value,
                child: const Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PersonalInfo(),
                        AppSpacing.spacingHorizontal32,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FoodConditionsColumn(),
                            AppSpacing.spacingVertical24,
                            HealthConditionsColumn(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomBar() {
    return CustomBar(
      title: 'my_profile'.tr,
      onBackPressed: () => Get.offAllNamed(AppRoutes.home),
      actions: [
        Obx(
          () => Visibility(
            visible: controller.isEditing,
            child: BaseButton(
              text: 'cancel'.tr,
              actionSeverity: ActionSeverity.danger,
              onTap: controller.cancel,
            ),
          ),
        ),
        AppSpacing.spacingHorizontal20,
        Obx(
          () => Visibility(
            visible: controller.isEditing,
            child: BaseButton(
              text: 'save'.tr,
              onTap: controller.handleProfileUpdate,
            ),
          ),
        ),
      ],
    );
  }
}