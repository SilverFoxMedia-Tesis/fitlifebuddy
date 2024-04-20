import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_bar/app_button.dart';
//import 'package:fitlifebuddy/widgets/app_bar/logo_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxBool expanded = false.obs;

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.paddingVertical32,
      child: Obx(
        () => Container(
          padding: AppPadding.paddingVertical32,
          width: expanded.value 
            ? ContainerSize.appBarWidthExpanded
            : ContainerSize.appBarWidth,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: AppBorderRadius.borderRadiusRight14,
              boxShadow: [AppBoxShadow.secondary25Blur8],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // LogoButton(
                  //   icon: AppIcons.logo, 
                  //   text: 'fitlifebuddy'.tr,
                  //   onTap: () {
                  //     expanded.value = !expanded.value;
                  //   },
                  // ),
                  AppSpacing.spacingVertical32,
                  AppButton(
                    icon: AppIcons.home, 
                    text: 'home'.tr,
                    onTap: () => Get.toNamed(AppRoutes.home),
                  ),
                  AppSpacing.spacingVertical32,
                  AppButton(
                    icon: AppIcons.person, 
                    text: 'my_profile'.tr,
                    onTap: () => Get.toNamed(AppRoutes.profile),
                  ),
                  AppSpacing.spacingVertical32,
                  AppButton(
                    icon: AppIcons.notification,
                    text: 'notifications'.tr,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton(icon: AppIcons.settings, text: 'settings'.tr, colorNumber: 1),
                  AppSpacing.spacingVertical32,
                  AppButton(icon: AppIcons.help, text: 'help'.tr, colorNumber: 1),
                ],
              ),
            ]
            ),
        ),
      ),
    );
  }
}