import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/widgets/buttons/action_severity.dart';
import 'package:fitlifebuddy/widgets/buttons/button_size.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final ButtonSize? size;
  final ActionSeverity? actionSeverity;
  final void Function()? onTap;
  final bool enabled;

  const BaseButton({
    super.key, 
    required this.text,
    this.textColor = AppColors.white,
    this.size,
    this.actionSeverity,
    this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          maxWidth: getWitdh() ?? double.infinity,
        ),
        height: ContainerSize.baseButtonHeight,
        decoration: BoxDecoration(
          color: enabled ? getBackgroundColor() : AppColors.disabled,
          borderRadius: AppBorderRadius.borderRadius24,
        ),
        child: Text(
          text,
          style: AppTextStyle.robotoSemibold14.copyWith(
            color: textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

    double? getWitdh() {
    switch (size) {
      case ButtonSize.small:
        return 100;
      case ButtonSize.medium:
        return 150;
      case ButtonSize.large:
        return 200;
      default:
        return null;
    }
  }

  Color getBackgroundColor() {
    switch (actionSeverity) {
      case ActionSeverity.danger:
        return AppColors.danger;
      case ActionSeverity.warning:
        return AppColors.warning;
      case ActionSeverity.success:
        return AppColors.success;
      default:
        return AppColors.secondary;
    }
  }
}