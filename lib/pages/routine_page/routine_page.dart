import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/utils/text_utils.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/pages/routine_page/routine_controller.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/buttons/action_severity.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:fitlifebuddy/widgets/custom_bar/custom_bar.dart';
import 'package:fitlifebuddy/widgets/empty_result/empty_result.dart';
import 'package:fitlifebuddy/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutinePage extends GetView<RoutineController> {
  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: Padding(
        padding: AppPadding.paddingPage,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.spacingVertical24,
              buildCustomBar(),
              AppSpacing.spacingVertical24,
              Obx(
                () => LoadingWidget(
                  isLoading: controller.loading.value,
                  child: controller.hasExercises
                    ? buildExercises()
                    : EmptyResult(message: 'no_routine'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomBar() {
    return CustomBar(
      title: '${'routine'.tr} | ',
      extraTitle: controller.currentDateTime,
      onBackPressed: () => Get.toNamed(AppRoutes.plan),
      actions: [
        Obx(
          () => BaseButton(
            text: controller.completed ? 'completed'.tr : "mark_as_completed".tr,
            onTap: () async => await controller.changeRoutineToCompleted(),
            loading: controller.changingStatus.value,
            disabled: controller.completed,
          ),
        ),
      ],
    );
  }

  Widget buildExercises() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: controller.currentExercises.map((entry) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildExercise(entry),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildExercise(Exercise exercise) {
    return Row(
      children: [
        PlanItemCard(
          text: fixEncoding(exercise.workout ?? ''), 
          description: '${exercise.repsPerSet} repeticiones (${exercise.sets})',
          image: exercise.imageUrl,
        ),
        AppSpacing.spacingHorizontal20,
        Obx(
          () => BaseButton(
            text: 'edit_exercise'.tr,
            actionSeverity: ActionSeverity.warning,
            onTap: () => controller.openChangeExerciseDialog(exercise),
            disabled: controller.completed,
          ),
        ),
      ],
    );
  }
}