import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:flutter/material.dart';

class AppSwicth extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  final String title;
  final String subtitle;
  final bool disabled;

  const AppSwicth({
    required this.value,
    this.onChanged,
    required this.title,
    required this.subtitle,
    this.disabled = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.light,
      child: SwitchListTile(
        value: value,
        onChanged: disabled ? null : onChanged,
        activeTrackColor: AppColors.primary.withOpacity(0.5),
        inactiveThumbColor: AppColors.disabled,
        inactiveTrackColor: AppColors.disabled.withOpacity(0.5),
        thumbColor: value ? WidgetStateProperty.all(AppColors.primary) : null,
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        splashRadius: 0,
        title: Text(
          title,
          style: AppTextStyle.robotoSemibold14,
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyle.robotoRegular14,
        ),
        dense: true,
        contentPadding: AppPadding.padding16,
        hoverColor: Colors.transparent,

      ),
    );
  }
}