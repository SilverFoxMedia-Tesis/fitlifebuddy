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
  final bool outlined;
  const AppIconButton({
    required this.iconData,
    this.iconColor = AppColors.light,
    this.size = 14,
    this.onTap,
    this.backgroundColor = AppColors.primary,
    this.enabled = true,
    this.outlined = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      child: Container(
        padding: AppPadding.padding8,
        decoration: BoxDecoration(
          color: _buildBackgroundColor(),
          shape: BoxShape.circle,
          boxShadow: enabled && !outlined ? const [AppBoxShadow.primary25Blur8] : null,
        ),
        child: Icon(
          iconData,
          color: iconColor,
          size: size,
        ),
      ),
    );
  }

  Color? _buildBackgroundColor() {
    if (outlined) {
      return Colors.transparent;
    } else if (enabled) {
      return backgroundColor;
    } else {
      return AppColors.disabled;
    }
  }
}