import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/pages/routine_page/routine_controller.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_icon_button/app_icon_button.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppIconButton(
                    iconData: Icons.arrow_back_ios_rounded,
                    iconColor: AppColors.secondary,
                    size: ContainerSize.iconSize,
                    onTap: () => Get.offAllNamed(AppRoutes.plan),
                    outlined: true,
                    ),
                    AppSpacing.spacingHorizontal14,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${'routine'.tr} | ',
                            style: AppTextStyle.robotoSemibold24.copyWith(
                              color: AppColors.secondary,
                            ),
                          ),
                          TextSpan(
                            text: controller.getRoutineDate(),
                            style: AppTextStyle.robotoRegular24.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                BaseButton(
                  text: 'completed'.tr,
                  width: ContainerSize.baseButtonSmallWidth,
                  backgroundColor: AppColors.secondary,
                  onTap: controller.changeRoutineToCompleted,
                ),
              ],
            ),
            AppSpacing.spacingVertical24,
            // Row(
            //   children: [
            //     const PlanItemCard(text: 'Ejercicio 1', description: '4 x 60 s', image: AppIcons.exercise1),
            //     AppSpacing.spacingHorizontal20,
            //     BaseButtom(
            //       text: 'Cambiar',
            //       onTap: () {
            //         Get.dialog(
            //           Dialog(
            //             backgroundColor: AppColors.secondary.withOpacity(0.5),
            //             child: const ChangeExerciseCard(),
            //           ),
            //         );
            //       },
            //       backgroundColor: AppColors.warning,
            //       width: 160,
            //     ),
            //   ],
            // ),
            Column(
              children: controller.exercises.map((exercise) {
                return buildExercise(
                  exercise.workout ?? '',
                  '${exercise.repsPerSet} x ${exercise.sets}',
                  () {},
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildExercise(String exerciseName, String image, void Function()? onTapExercise) {
    return Row(
      children: [
        PlanItemCard(
          text: exerciseName, 
          description: '6 x 60 s',
          image: image,
        ),
        AppSpacing.spacingHorizontal20,
        BaseButton(
          text: 'change'.tr,
          width: ContainerSize.baseButtonSmallWidth,
          backgroundColor: AppColors.warning,
          onTap: onTapExercise,
        ),
      ],
    );
  }
}