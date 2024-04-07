import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/empty_container.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.paddingPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.spacingVertical24,
              AppSpacing.spacingVertical24,
              Text(
                'Mi plan actual',
                style: AppTextStyle.robotoSemibold34.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              Expanded(
                child: Center(
                  child: EmptyContainer(
                    text: 'Aún no tienes un plan en curso. Dale clic al siguiente botón para generar un nuevo plan.', 
                    buttonTitle: 'Generar plan',
                    onTap: () => Get.toNamed(AppRoutes.plan),
                  ),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}