import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppButton extends StatelessWidget {
  final String icon;
  final String text;
  final bool isTextHidden;
  final num? colorNumber;
  final Color fontColor;

  const AppButton({
    super.key, 
    required this.icon, 
    required this.text, 
    this.isTextHidden = true, 
    this.colorNumber,
    this.fontColor = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        width: isTextHidden ? 56 : 176,
        height: 56,
        decoration: BoxDecoration(
          color: _getColor(colorNumber),
          borderRadius: isTextHidden ? null : BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff3D5A80).withOpacity(0.25), 
              blurRadius: 8,
            )
          ],
          shape: isTextHidden ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              //fit: BoxFit.fitHeight,
            ),
            if (!isTextHidden) ...[
              const SizedBox(width: 16),
              Text(
                text,
                style: TextStyle(
                  color: fontColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.70
                ),
              ),
            ]
          ],
        ),
      ),
      onTap: () {},
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