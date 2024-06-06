import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/core/utils/text_utils.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/pages/plan_page/plan_controller.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/widgets/empty_result/empty_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var exerciseIndex = 0;
class RoutineView extends GetView<PlanController> {
  const RoutineView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: controller.viewRoutineDetails,
              child: Text(
                'workout_routine'.tr,
                style: AppTextStyle.robotoSemibold20,
              ),
            ),
            if (controller.hasExercises)
              _buildExercises(),
            if (!controller.hasExercises)
              EmptyResult(message: 'no_routine'.tr),
        ],
        ),
      ),
    );
  }

  Widget _buildExercises() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (var entry in controller.exercises.entries)
          Padding(
            padding: AppPadding.paddingOnlyTop24,
            child: _buildMeal(entry.key, entry.value),
          ),
      ],
    );
  }

    Widget _buildMeal(int index, Exercise exercise) {
    return PlanItemCard(
      text: fixEncoding(exercise.workout ?? ''), 
      description: '${exercise.repsPerSet} repeticiones (${exercise.sets} sets)',
      image: exercise.imageUrl,
    );
  }
}