import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/recover_password_page/widgets/recover_password_form.dart';
import 'package:fitlifebuddy/widgets/cover/cover.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPasswordPage extends GetView {
  const RecoverPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      isLogged: false,
      child: const Row(
        children: [
          SizedBox(
            width: 591,
            child: RecoverPasswordForm(),
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