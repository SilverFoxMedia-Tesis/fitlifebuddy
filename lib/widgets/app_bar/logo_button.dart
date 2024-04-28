import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: ContainerSize.logoSize,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: ContainerSize.logoSize,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}