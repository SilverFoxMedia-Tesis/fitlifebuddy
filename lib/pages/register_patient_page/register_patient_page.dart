import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/register_patient_page/regiter_patient_controller.dart';
import 'package:fitlifebuddy/widgets/cover/cover.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPatientPage extends GetView<RegisterPatientController> {
  const RegisterPatientPage({super.key});

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
                itemCount: controller.pages.length,
                itemBuilder: (context, index) => controller.pages[index],
              ),
            ),
          Cover(
            title: 'welcome_to'.tr, 
            description: 'phrase0'.tr,
            image: '../assets/images/cover_photo.png',
          ),
        ],
      ),
    );
  }
}