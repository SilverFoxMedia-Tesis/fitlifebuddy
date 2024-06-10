import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/size/space.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/register_patient_page/register_patient_controller.dart';
import 'package:fitlifebuddy/pages/register_patient_page/widgets/food_conditions_form.dart';
import 'package:fitlifebuddy/pages/register_patient_page/widgets/health_conditions_form.dart';
import 'package:fitlifebuddy/pages/register_patient_page/widgets/personal_info_form.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:fitlifebuddy/widgets/cover/cover.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPatientPage extends GetView<RegisterPatientController> {
  RegisterPatientPage({super.key});

  final List<Widget> pages = [
    const PersonalInfoForm(),
    const HealthConditionsForm(),
    const FoodConditionsForm(),
  ];

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      isLogged: false,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: PageView.builder(
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pages.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: AppPadding.padding32,
                  child: Column(
                    children: [
                      buildProgressIndicator(),
                      AppSpacing.spacingVertical24,
                      Expanded(
                        child: SingleChildScrollView(
                          child: pages[index],
                        ),
                      ),
                      AppSpacing.spacingVertical24,
                      buildNavegationButtons(),
                    ],
                  ),
                );
              },
            ),
          ),
          const Cover(),
        ],
      ),
    );
  }

  Widget buildProgressIndicator() {
    return ClipRRect(
      borderRadius: AppBorderRadius.borderRadius14,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: ContainerSize.baseContainerdWidth),
        child: Obx(
          () => LinearProgressIndicator(
            value: controller.currentPage.value / (pages.length),
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.secondary),
            backgroundColor: AppColors.disabled,
            minHeight: Space.space8,
          ),
        ),
      ),
    );
  }

  Widget buildNavegationButtons() {
    return Obx(
      () => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (controller.currentPage.value == 0)
            BaseButton(
              text: 'Siguiente',
              onTap: () async => await controller.savePersonalInfo(),
            ),
          if (controller.currentPage.value == 1)
            BaseButton(
              text: 'Siguiente',
              onTap: () async => await controller.saveHealthConditions(),
            ),
          if (controller.currentPage.value == 2)
            BaseButton(
              text: 'Registrar',
              loading: controller.loading.value,
              onTap: () async => await controller.saveFoodConditions(),
            ),
        ],
      ),
    );
  }
}