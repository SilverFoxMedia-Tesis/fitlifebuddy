import 'package:fitlifebuddy/widgets/app_bar/app_button.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      width: 105,
      height:960,
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
      child: const Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton(icon: '../assets/images/home.svg', text: 'text'),
                SizedBox(height: 32),
                AppButton(icon: '../assets/images/person.svg', text: 'text'),
                SizedBox(height: 32),
                AppButton(icon: '../assets/images/notification.svg', text: 'text'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton(icon: '../assets/images/settings.svg', text: 'text', colorNumber: 1),
                SizedBox(height: 32),
                AppButton(icon: '../assets/images/help.svg', text: 'text', colorNumber: 1),
              ],
            ),
          ]
          ),
      ),
    );
  }
}