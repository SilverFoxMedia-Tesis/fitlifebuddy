// ignore: unused_import
import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_card/app_card.dart';
import 'package:fitlifebuddy/widgets/banner/app_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientHomePage extends GetView {
  const PatientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: Padding(
        padding: AppPadding.paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBanner(text: '¡Estás en el camino correcto hacia una vida saludable! Sigue adelante y mantén el enfoque en tu plan de alimentación y rutinas de ejercicio.'),
            AppSpacing.spacingVerticalXxxl,
            AppCard(
              title: 'Mi plan actual', 
              description: 'Revisa la información de tu plan alimentario y de ejercicios', 
              icon: 'assets/icons/person.svg',
              onTap: () => Get.toNamed(AppRoutes.plan),
            )
          ]
        ),
      ),
    );
  }
}