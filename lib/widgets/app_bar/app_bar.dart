import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/spacing/container_sizes.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/wrapper/border_radius_wrapper.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_bar/app_button.dart';
import 'package:fitlifebuddy/widgets/app_bar/logo_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxBool expanded = false.obs;

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.paddingVerticalXxxl,
      child: Obx(
        () => Container(
          padding: AppPadding.paddingAppBar,
          width: expanded.value 
            ? ContainerSizes.appBarWidthExpanded
            : ContainerSizes.appBarWidth,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadiusWrapper.borderRadiusRightLg,
              boxShadow: [AppBoxShadows.secondary25Blur8],
          ),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LogoButton(
                      icon: '../assets/icons/logo.svg', 
                      text: 'fitlifebuddy'.tr,
                      onTap: () {
                        expanded.value = !expanded.value;
                      },
                    ),
                    AppSpacing.spacingVerticalXxxl,
                    AppButton(
                      icon: '../assets/icons/home.svg', 
                      text: 'home'.tr,
                      onTap: () => Get.toNamed(AppRoutes.pacientHome),
                    ),
                    AppSpacing.spacingVerticalXxxl,
                    AppButton(icon: '../assets/icons/person.svg', text: 'my_profile'.tr),
                    AppSpacing.spacingVerticalXxxl,
                    AppButton(icon: '../assets/icons/notification.svg', text: 'notifications'.tr),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(icon: '../assets/icons/settings.svg', text: 'settings'.tr, colorNumber: 1),
                    AppSpacing.spacingVerticalXxxl,
                    AppButton(icon: '../assets/icons/help.svg', text: 'help'.tr, colorNumber: 1),
                  ],
                ),
              ]
              ),
          ),
        ),
      ),
    );
  }
}