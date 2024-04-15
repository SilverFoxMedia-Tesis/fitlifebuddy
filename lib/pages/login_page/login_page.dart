import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/login_page/widgets/login_form.dart';
import 'package:fitlifebuddy/widgets/cover/cover.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      isLogged: false,
      child: Row(
        children: [
          const Expanded(
            flex: 5,
            child: LoginForm(),
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