import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
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
                      icon: AppIcons.logo, 
                      text: 'Fitlifebuddy'.tr,
                      onTap: () {
                        expanded.value = !expanded.value;
                      },
                    ),
                    AppSpacing.spacingVerticalXxxl,
                    AppButton(
                      icon: AppIcons.home, 
                      text: 'Home'.tr,
                      onTap: () => Get.toNamed(AppRoutes.home),
                    ),
                    AppSpacing.spacingVerticalXxxl,
                    AppButton(
                      icon: AppIcons.person, 
                      text: 'My profile'.tr,
                      onTap: () => Get.toNamed(AppRoutes.profile),
                    ),
                    AppSpacing.spacingVerticalXxxl,
                    AppButton(icon: AppIcons.notification, text: 'Notifications'.tr),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(icon: AppIcons.settings, text: 'Settings'.tr, colorNumber: 1),
                    AppSpacing.spacingVerticalXxxl,
                    AppButton(icon: AppIcons.help, text: 'Help'.tr, colorNumber: 1),
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