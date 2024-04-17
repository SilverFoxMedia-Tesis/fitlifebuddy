import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/register_patient_page/register_patient_controller.dart';
import 'package:fitlifebuddy/pages/register_patient_page/widgets/food_conditions_form.dart';
import 'package:fitlifebuddy/pages/register_patient_page/widgets/health_conditions_form.dart';
import 'package:fitlifebuddy/pages/register_patient_page/widgets/personal_info_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPatientPage extends GetView<RegisterPatientController> {
  RegisterPatientPage({super.key});

  final List<Widget> pages = [
    const PersonalInfoForm(),
    const FoodConditionsForm(),
    const HealthConditionsForm()
  ];

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      isLogged: false,
      child: PageView.builder(
        controller: controller.pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) => pages[index],
      ),
    );
  }
}