import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/utils/text_utils.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/pages/routine_page/routine_controller.dart';
import 'package:fitlifebuddy/widgets/app_dialog/app_dialog.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeExerciseDialog extends GetView<RoutineController> {
  const ChangeExerciseDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
        title: 'select_an_exercise'.tr,
        onClose: controller.onDialogClose,
        extraContent: Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.exercisesAvalibles.length,
            itemBuilder: (context, index) {
              final exercise = controller.exercisesAvalibles[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.onExerciseSelected(exercise);
                    },
                    child: PlanItemCard(
                      text: fixEncoding(exercise.workout ?? ''),
                      description: '${exercise.repsPerSet} x ${exercise.sets}',
                      image: exercise.imageUrl,
                    ),
                  ),
                  AppSpacing.spacingVertical20,
                ],
              );
            },
          ),
        ),
        actions: [
          Obx(
            () => BaseButton(
              text: 'edit_exercise'.tr,
              onTap: () => controller.changeExercise,
              loading: controller.loading.value,
            ),
          ),
        ],
    );
  }
}