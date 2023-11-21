import 'package:fitlifebuddy/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LogoButton extends StatelessWidget {
  final String icon;
  final String text;
  final void Function()? onTap;

  const LogoButton({
    super.key, 
    required this.icon, 
    required this.text, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: onTap,
        child: SizedBox(
          width: expanded.value ? 204 : 64,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 64,
                height: 64,
              ),
              if (expanded.value) ...[
                const SizedBox(width: 16),
                Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xff3D5A80),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.70
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}