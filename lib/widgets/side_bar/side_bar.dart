import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/pages/notifications_page/notifications_view.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_dialog/getx_dialog.dart';
import 'package:fitlifebuddy/widgets/side_bar/app_button.dart';
//import 'package:fitlifebuddy/widgets/app_bar/logo_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.paddingVertical32,
      child: Container(
          padding: AppPadding.paddingVertical32,
          width: ContainerSize.appBarWidth,
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
                    onTap: () {
                      final getXDialog = Get.find<GetXDialog>();
                      getXDialog.showDialog(
                      const Stack(
                        children: [
                          Positioned(
                            left: 140,
                            top: 32,
                            child: NotificationsView(),
                          ),
                        ],
                      ),
                    );
                    },
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TODO: oculto, no hay ninguna funcionalidad relacionada con este boton aun
                  // AppButton(
                  //   icon: AppIcons.settings, 
                  //   text: 'settings'.tr, 
                  //   enableDarkColor: true,
                  //   onTap: () => Get.toNamed(AppRoutes.settings),
                  // ),
                  // AppSpacing.spacingVertical32,
                  AppButton(
                    icon: AppIcons.help, 
                    text: 'help'.tr, 
                    enableDarkColor: true,
                    onTap: () => Get.toNamed(AppRoutes.questions),
                  ),
                  AppSpacing.spacingVertical32,
                  AppButton(
                    icon: AppIcons.logout, 
                    text: 'logout'.tr, 
                    enableDarkColor: true,
                    onTap: () => Get.offAllNamed(AppRoutes.login),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}