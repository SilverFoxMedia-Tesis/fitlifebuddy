import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final IconData iconData;
  final Color? iconColor;
  final double? size;
  final void Function()? onTap;
  final Color? backgroundColor;
  final bool enabled;
  const AppIconButton({
    required this.iconData,
    this.iconColor = AppColors.white,
    this.size = 14,
    this.onTap,
    this.backgroundColor = AppColors.primary,
    this.enabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      child: Container(
        padding: AppPadding.padding8,
        decoration: BoxDecoration(
          color: enabled ? backgroundColor : AppColors.disabled,
          shape: BoxShape.circle,
          boxShadow: enabled ? const [AppBoxShadow.primary25Blur8] : null,
        ),
        child: Icon(
          iconData,
          color: iconColor,
          size: size,
        )
      ),
    );
  }
}