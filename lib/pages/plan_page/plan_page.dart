import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/plan_page/plan_controller.dart';
//import 'package:fitlifebuddy/pages/plan_page/widgets/empty_container.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/meals/meals_view.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/routine/routine_view.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:fitlifebuddy/widgets/custom_bar/custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanPage extends GetView<PlanController> {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: SingleChildScrollView(
        padding: AppPadding.paddingPage,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.spacingVertical24,
              buildCustomBar(),
              AppSpacing.spacingVertical24,
              // if (!controller.hasPLan)
              // Center(
              //   child: EmptyContainer(
              //     text: 'no_plan'.tr, 
              //     buttonTitle: 'generate_plan'.tr,
              //     onTap: () => Get.toNamed(AppRoutes.routine),
              //   ),
              // ),
              // if (controller.hasPLan)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDateTimeLine(),
                  AppSpacing.spacingVertical24,
                  Text(
                    controller.getCurrentDateTime,
                    style: AppTextStyle.robotoRegular20.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  AppSpacing.spacingVertical24,
                  const SizedBox(
                    height: 360, //TODO: cambiar a valor dinamico
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MealsView(),
                        AppSpacing.spacingHorizontal32,
                        RoutineView()
                      ],
                    ),
                  ),
                ],
              )
            ]
          ),
        ),
      ),
    );
  }

  Widget buildCustomBar() {
    return CustomBar(
      title: 'my_current_plan'.tr,
      onBackPressed: () => Get.offAllNamed(AppRoutes.home),
      actions: [
        BaseButton(
          text: "edit_plan".tr,
          width: ContainerSize.baseButtonSmallWidth,
          backgroundColor: AppColors.warning,
        ),
      ],
    );
  }


  Widget buildDateTimeLine() {
    return Container(
      padding: AppPadding.padding24,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.borderRadius14,
        boxShadow: [AppBoxShadow.secondary25Blur8],
      ),
      child: EasyInfiniteDateTimeLine(
        itemBuilder: (_, dayNumber, dayName, monthName, fullDate, isSelected) {
          return Container(
            padding: AppPadding.paddingDateTimeLineItem,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.white,
              borderRadius: AppBorderRadius.borderRadiusXxxl,
              boxShadow: isSelected ? [AppBoxShadow.secondary25Blur8] : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dayName.capitalizeFirst ?? '',
                  style: AppTextStyle.robotoRegular16.copyWith(
                    color: isSelected ? AppColors.white : AppColors.secondary,
                  ),
                ),
                AppSpacing.spacingVertical16,
                Text(
                  dayNumber,
                  style: AppTextStyle.robotoSemibold20.copyWith(
                    color: isSelected ? AppColors.white : AppColors.primary,
                  ),
                ),
                AppSpacing.spacingVertical4,
                Container(
                  width: ContainerSize.pointSize,
                  height: ContainerSize.pointSize,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.white : AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          );
        },
        locale: "es_PE",
        controller: controller.dateTimeLineController,
        firstDate: DateTime(2024),
        focusDate: controller.currentDateTime.value,
        lastDate: DateTime(2024, 12, 31),
        showTimelineHeader: false,
        onDateChange: controller.onDateChange,
      ),
    );
  }
}
