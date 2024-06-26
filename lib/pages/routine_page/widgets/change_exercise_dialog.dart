import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/utils/text_utils.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/pages/routine_page/routine_controller.dart';
import 'package:fitlifebuddy/widgets/app_dialog/app_dialog.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:fitlifebuddy/widgets/empty_result/empty_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeExerciseDialog extends GetView<RoutineController> {
  const ChangeExerciseDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
        title: 'select_an_exercise'.tr,
        onClose: controller.onDialogClose,
        extraContent: controller.hasOptions
          ? buildOptions()
          : EmptyResult(message: 'no_options'.tr),
        actions: [
          Obx(
            () => BaseButton(
              text: 'edit_exercise'.tr,
              onTap: () async => await controller.changeExercise(),
              loading: controller.changing.value,
              disabled: !controller.isSelected.value,
            ),
          ),
        ],
    );
  }

  Widget buildOptions() {
    return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.availableExercises.length,
          itemBuilder: (context, index) {
            final exercise = controller.availableExercises[index];
            return Column(
              children: [
                InkWell(
                  onTap: () => controller.onExerciseSelected(exercise),
                  child: Obx(
                    () => PlanItemCard(
                      text: fixEncoding(exercise.workout ?? ''),
                      description: '${exercise.repsPerSet} x ${exercise.sets}',
                      image: exercise.imageUrl,
                      border: (controller.exerciseSelected.value == exercise)
                        ? true : null,
                    ),
                  ),
                ),
                AppSpacing.spacingVertical20,
              ],
            );
          },
        ),
      );
  }
}