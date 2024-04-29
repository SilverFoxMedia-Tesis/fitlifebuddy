import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/plan_page/plan_controller.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutineView extends GetView<PlanController> {
  const RoutineView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: controller.viewRoutineDetails,
            child: Text(
              'workout_routine'.tr,
              style: AppTextStyle.robotoSemibold20.copyWith(
                color: AppColors.secondary,
              ),
            ),
          ),
          if (controller.hasExercises)
            _buildExercises(),
          if (!controller.hasExercises)
            _buildEmptyList(),
      ],
      ),
    );
  }

  Widget _buildExercises() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: controller.exercises.map((exercise) {
        return Padding(
          padding: AppPadding.paddingOnlyTop24,
          child: PlanItemCard(
            text: exercise.workout ?? '',
            description: '${exercise.repsPerSet} x ${exercise.sets}',
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEmptyList() {
    return Padding(
      padding: AppPadding.paddingOnlyTop24,
      child: Text(
        'no_routine'.tr,
        style: AppTextStyle.robotoRegular16.copyWith(
          color: AppColors.secondary,
        ),
      ),
    );
  }
}