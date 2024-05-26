import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';

class EmptyContainer extends StatelessWidget {
  final String text;
  final String buttonTitle;
  final void Function()? onTap;

  const EmptyContainer({
    super.key,
    required this.text, 
    required this.buttonTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: ContainerSize.baseButtonWidth,
          child: Text(
            text,
            style: AppTextStyle.robotoSemibold16.copyWith(
              color: AppColors.secondary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        AppSpacing.spacingVertical24,
        BaseButton(
          text: buttonTitle,
          onTap: onTap,
        ),
      ],
    );
  }
}