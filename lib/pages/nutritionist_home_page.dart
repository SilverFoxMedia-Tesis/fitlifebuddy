import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_card/app_card.dart';
import 'package:fitlifebuddy/widgets/banner/app_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NutritionistHomePage extends GetView {
  const NutritionistHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: Padding(
        padding: AppPadding.paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBanner(text: 'Bienvenido nutricionista!'),
            AppSpacing.spacingVertical32,
            Row(
              children: [
                AppCard(
                  title: 'Mis pacientes', 
                  description: 'Revisa la información de cada uno de tus pacientes', 
                  icon: AppIcons.person,
                  onTap: () => Get.toNamed(AppRoutes.patients)
                ),
                AppSpacing.spacingHorizontal16,
                AppCard(
                  title: 'Registrar paciente', 
                  description: 'Inscribe a tu paciente', 
                  icon: AppIcons.person,
                  onTap: () => Get.toNamed(AppRoutes.registerPatient)
                ),
              ],
            )
          ]
        ),
      ),
    );
  }
}