import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/plan_page/plan_controller.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/meals_view/meals_view.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/routine_view/routine_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanView extends GetView<PlanController> {
  const PlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDateTimeLine(),
        AppSpacing.spacingVertical24,
        Obx(
          () => Text(
            controller.getCurrentDateTime,
            style: AppTextStyle.robotoRegular20,
          ),
        ),
        AppSpacing.spacingVertical24,
        const SizedBox(
            height: 300,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MealsView(),
                AppSpacing.spacingHorizontal32,
                RoutineView(),
              ],
            ),
          ),
      ],
    );
  }

    Widget buildDateTimeLine() {
    return Container(
      padding: AppPadding.padding24,
      decoration: const BoxDecoration(
        color: AppColors.light,
        borderRadius: AppBorderRadius.borderRadius14,
        boxShadow: [AppBoxShadow.secondary25Blur8],
      ),
      child: Obx(
        //TODO: mejorar este widget
        () => EasyInfiniteDateTimeLine(
          controller: controller.dateTimeLineController,
          firstDate: DateTime(2024),
          focusDate: controller.currentDateTime.value,
          lastDate: DateTime(2024, 12, 31),
          showTimelineHeader: false,
          onDateChange: (value) => controller.onDateChange(value),
          itemBuilder: (_, date, isSelected, onTap) {
            final textColor = isSelected ? AppColors.light : AppColors.secondary;
            return InkWell(
              onTap: onTap,
              child: Container(
                padding: AppPadding.paddingDateTimeLine,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.light,
                  borderRadius: AppBorderRadius.borderRadiusXxxl,
                  boxShadow: isSelected ? [AppBoxShadow.secondary25Blur8] : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      EasyDateFormatter.shortDayName(date, "es_PE").capitalizeFirst ?? '',
                      style: AppTextStyle.robotoRegular16.copyWith(
                        color: textColor,
                      ),
                    ),
                    AppSpacing.spacingVertical16,
                    Text(
                      date.day.toString(),
                      style: AppTextStyle.robotoSemibold20.copyWith(
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}