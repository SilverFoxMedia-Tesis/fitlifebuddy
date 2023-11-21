import 'package:fitlifebuddy/widgets/app_bar/app_button.dart';
import 'package:fitlifebuddy/widgets/app_bar/logo_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxBool expanded = false.obs;

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal:16),
        width: expanded.value ? 244 : 105,
        height: 960,
        decoration: BoxDecoration(
          color: const Color(0xff80A1D4),
          borderRadius: const BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff3D5A80).withOpacity(0.25), 
                blurRadius: 8,
              )
            ],
        ),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LogoButton(
                    icon: '../assets/images/logo.svg', 
                    text: 'fitlifebuddy'.tr,
                    onTap: () {
                      expanded.value = !expanded.value;
                    },
                  ),
                  const SizedBox(height: 32),
                  AppButton(icon: '../assets/images/home.svg', text: 'home'.tr),
                  const SizedBox(height: 32),
                  AppButton(icon: '../assets/images/person.svg', text: 'my_profile'.tr),
                  const SizedBox(height: 32),
                  AppButton(icon: '../assets/images/notification.svg', text: 'notifications'.tr),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton(icon: '../assets/images/settings.svg', text: 'settings'.tr, colorNumber: 1),
                  const SizedBox(height: 32),
                  AppButton(icon: '../assets/images/help.svg', text: 'help'.tr, colorNumber: 1),
                ],
              ),
            ]
            ),
        ),
      ),
    );
  }
}