import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/spacing/container_sizes.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/wrapper/border_radius_wrapper.dart';
import 'package:fitlifebuddy/core/theme/wrapper/input_border.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType inputType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String? suffixText;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final bool obscureText;
  final bool readOnly;
  final double width;

  const AppTextfield({
    super.key,
    this.title,
    this.hintText,
    this.controller,
    this.inputType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.suffixText,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.obscureText = false,
    this.readOnly = false,
    this.width = ContainerSizes.baseTextfieldWidth,
  });

  void _onChanged(FormFieldState<String> formFieldState, String value) {
    var onChanged = this.onChanged;
    if (onChanged != null) {
      onChanged(value);
    }
    formFieldState.didChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      initialValue: controller?.text,
      builder: (FormFieldState<String> formFieldState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Text(
                title!,
                style: buildTitleTextStyle(),
              ),
              AppSpacing.spacingVerticalSm,
            ],
            Container(
              width: width,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadiusWrapper.borderRadius14,
                boxShadow: [AppBoxShadows.primary25Blur8],
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: buildTextStyle(),
                  suffixIcon: suffixIcon != null ? buildSuffixIcon(): null,
                  suffixIconColor: AppColors.primary,
                  suffixIconConstraints: const BoxConstraints(),
                  suffixText: suffixText,
                  suffixStyle: buildTextStyle(),
                  contentPadding: AppPadding.paddingHorizontalLg,
                  border: InputBorder.none,
                  enabledBorder: AppInputBorder.hiddenBorder,
                  focusedBorder: AppInputBorder.focusedBorder,
                  errorBorder: AppInputBorder.errorBorder,
                ),
                keyboardType: inputType,
                style: AppTextStyle.robotoRegular14.copyWith(
                  color: AppColors.secondary,
                ),
                readOnly: readOnly,
                obscureText: obscureText,
                onChanged: (String value) {
                  _onChanged(formFieldState, value);
                },
                cursorColor: AppColors.secondary,
              ),
            ),
            if (formFieldState.hasError) ...[
              AppSpacing.spacingVerticalXs,
              Text(
                formFieldState.errorText!,
                style: AppTextStyle.robotoMedium12.copyWith(
                  color: AppColors.danger,
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  TextStyle buildTextStyle() {
    switch (readOnly) {
      case true:
        return AppTextStyle.robotoRegular14.copyWith(
          color: AppColors.secondary,
        );
      default:
      return AppTextStyle.robotoRegular14.copyWith(
          color: AppColors.primary,
        );
    }
  }

  TextStyle buildTitleTextStyle() {
    switch (readOnly) {
      case true:
        return AppTextStyle.robotoMedium14.copyWith(
          color: AppColors.secondary,
        );
      default:
      return AppTextStyle.robotoMedium14.copyWith(
          color: AppColors.primary,
        );
    }
  }

  Widget buildSuffixIcon() {
    return InkWell(
      onTap: onSuffixIconPressed,
      child: Padding(
        padding: AppPadding.paddingHorizontalLg,
        child: Icon(
          suffixIcon,
          size: ContainerSizes.iconSize,
        ),
      ),
    );
  }
}