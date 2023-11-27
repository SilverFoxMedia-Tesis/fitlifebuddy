import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/login_page/widgets/login_form.dart';
import 'package:fitlifebuddy/widgets/cover/cover.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      isLogged: false,
      child: const Row(
        children: [
          SizedBox(
            width: 591,
            child: LoginForm(),
            ),
          Cover(
            title: 'Bienvenido a FitLifeBuddy', 
            description: 'Combate el sobrepeso y mejora tus hábitos alimenticios y de ejercicio. ¡Únete ahora!'
          )
        ],
      ),
    );
  }
}