import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/widgets/buttons/action_severity.dart';
import 'package:fitlifebuddy/widgets/buttons/button_size.dart';
import 'package:fitlifebuddy/widgets/buttons/button_type.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final ButtonSize? size;
  final ButtonType? type;
  final ActionSeverity? actionSeverity;
  final void Function()? onTap;
  final bool outlined;
  final bool loading;
  final bool disabled;

  const BaseButton({
    super.key, 
    required this.text,
    this.size = ButtonSize.standard,
    this.type = ButtonType.elevated,
    this.actionSeverity = ActionSeverity.primary,
    this.onTap,
    this.outlined = false,
    this.loading = false,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          maxWidth: getMaxWitdh(),
        ),
        height: ContainerSize.baseButtonHeight,
        decoration: BoxDecoration(
          color: getColor(),
          borderRadius: AppBorderRadius.borderRadius24,
          border: getBorder(),
        ),
        child: Text(
          text,
          style: AppTextStyle.robotoSemibold14.copyWith(
            color: getTextColor(),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  double getMaxWitdh() {
    switch (size) {
      case ButtonSize.standard:
        return ContainerSize.baseButtonSmallWidth;
      case ButtonSize.large:
        return ContainerSize.baseButtonWidth;
      case ButtonSize.fluid:
        return double.infinity;
      default:
        return double.infinity;
    }
  }

  Color getActionColor() {
    if (disabled) return AppColors.disabled;
    switch (actionSeverity) {
      case ActionSeverity.primary:
        return AppColors.primary;
      case ActionSeverity.secondary:
        return AppColors.secondary;
      case ActionSeverity.success:
        return AppColors.success;
      case ActionSeverity.danger:
        return AppColors.danger;
      case ActionSeverity.warning:
        return AppColors.warning;
      default:
        return AppColors.primary;
    }
  }

  Color getColor() {
    if (type == ButtonType.elevated) {
      return getActionColor();
    }
    return Colors.transparent;
  }

  Border? getBorder() {
    if (type == ButtonType.outlined) {
      return Border.all(
        color: getActionColor(),
        width: 2.0,
      );
    }
    return null;
  }

  Color getTextColor() {
    if (type == ButtonType.elevated) {
      return AppColors.light;
    }
    return getActionColor();
  }
}