import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/pages/routine_page/routine_controller.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/buttons/action_severity.dart';
import 'package:fitlifebuddy/widgets/buttons/primary_button.dart';
import 'package:fitlifebuddy/widgets/custom_bar/custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutinePage extends GetView<RoutineController> {
  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: Padding(
        padding: AppPadding.paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.spacingVertical24,
            buildCustomBar(),
            AppSpacing.spacingVertical24,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: controller.exercises.map((exercise) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildExercise(
                        exercise, null
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomBar() {
    return CustomBar(
      title: '${'routine'.tr} | ',
      extraTitle: controller.getRoutineDate(),
      onBackPressed: () => Get.offAllNamed(AppRoutes.plan),
      actions: [
        PrimaryButton(
          text: 'completed'.tr,
          onTap: controller.changeRoutineToCompleted,
        ),
      ],
    );
  }

  Widget buildExercise(Exercise exercise, String? image) {
    return Row(
      children: [
        PlanItemCard(
          text: exercise.workout ?? '', 
          description: '${exercise.repsPerSet} x ${exercise.sets}',
          image: exercise.imageUrl,
        ),
        AppSpacing.spacingHorizontal20,
        PrimaryButton(
          text: 'edit_exercise'.tr,
          actionSeverity: ActionSeverity.warning,
          onTap: controller.changeExercise,
        ),
      ],
    );
  }
}