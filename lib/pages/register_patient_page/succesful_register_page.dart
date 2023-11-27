import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/register_patient_page/widgets/successful_register_container.dart';
import 'package:fitlifebuddy/widgets/cover/cover.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccesfulRegisterPage extends GetView {
  const SuccesfulRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      isLogged: false,
      child: const Row(
        children: [
          SizedBox(
            width: 591,
            child: SuccesfulRegisterContainer(),
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