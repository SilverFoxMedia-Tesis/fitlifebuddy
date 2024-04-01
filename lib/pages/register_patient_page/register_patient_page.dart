import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/register_patient_page/widgets/personal_info_form.dart';
import 'package:fitlifebuddy/widgets/cover/cover.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPatientPage extends GetView {
  const RegisterPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      isLogged: false,
      child: Row(
        children: [
          const Expanded(
            flex: 5,
            child: PersonalInfoForm(),
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