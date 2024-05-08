import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/register_patient_page/register_patient_controller.dart';
import 'package:fitlifebuddy/pages/register_patient_page/widgets/food_conditions_form.dart';
import 'package:fitlifebuddy/pages/register_patient_page/widgets/health_conditions_form.dart';
import 'package:fitlifebuddy/pages/register_patient_page/widgets/personal_info_form.dart';
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
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  padding: AppPadding.padding32,
                  child: pages[index],
                );
              },
            ),
          ),
          const Cover(),
        ],
      ),
    );
  }
}