import 'package:fitlifebuddy/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final String icon;
  final String text;
  final num? colorNumber;
  final void Function()? onTap;

  const AppButton({
    super.key, 
    required this.icon, 
    required this.text, 
    this.colorNumber, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          width: expanded.value ? 176 : 56,
          decoration: BoxDecoration(
            color: _getColor(colorNumber),
            borderRadius: expanded.value ? BorderRadius.circular(32) : null,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff3D5A80).withOpacity(0.25), 
                blurRadius: 8,
              )
            ],
            shape: expanded.value ? BoxShape.rectangle : BoxShape.circle,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 24,
                height: 24,
              ),
              if (expanded.value) ...[
                const SizedBox(width: 16),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
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

  Color _getColor(num? colorNumber) {
    switch (colorNumber) {
      case 1:
        return const Color(0xff3D5A80);
      default:
        return const Color(0xff80A1D4);
    }
  }
}