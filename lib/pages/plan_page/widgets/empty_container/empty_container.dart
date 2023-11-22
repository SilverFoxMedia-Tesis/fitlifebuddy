import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/spacing/container_sizes.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';

class EmptyContainer extends StatelessWidget {
  final String text;
  final String buttonTitle;

  const EmptyContainer({
    super.key,
    required this.text, 
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: ContainerSizes.baseButtonWidth,
          child: Text(
            text,
            style: AppTextStyle.robotoSemibold24.copyWith(
              color: AppColors.secondary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        AppSpacing.spacingVerticalXxl,
        BaseButtom(
          text: buttonTitle,
        ),
      ],
    );
  }
}