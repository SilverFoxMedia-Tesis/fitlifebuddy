import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/pages/routine_page/routine_controller.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/buttons/action_severity.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:fitlifebuddy/widgets/custom_bar/custom_bar.dart';
import 'package:fitlifebuddy/widgets/empty_result/empty_result.dart';
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
            if (controller.hasExercises)
              buildExercises(),
            if (!controller.hasExercises)
              EmptyResult(message: 'no_routine'.tr),
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
        BaseButton(
          text: 'completed'.tr,
          onTap: controller.changeRoutineToCompleted,
        ),
      ],
    );
  }

  Widget buildExercises() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: controller.currentExercises.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildExercise(
                entry.value, null
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildExercise(Exercise exercise, String? image) {
    return Row(
      children: [
        PlanItemCard(
          text: exercise.workout ?? '', 
          description: '${exercise.repsPerSet} repeticiones (${exercise.sets})',
          image: exercise.imageUrl,
        ),
        AppSpacing.spacingHorizontal20,
        BaseButton(
          text: 'edit_exercise'.tr,
          actionSeverity: ActionSeverity.warning,
          onTap: controller.openChangeExerciseDialog,
        ),
      ],
    );
  }
}