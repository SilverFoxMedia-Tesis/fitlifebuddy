import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/input_border.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final bool enabled;
  final double width;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;

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
    this.enabled = true,
    this.width = ContainerSize.baseTextfieldWidth,
    this.onTap,
    this.inputFormatters,
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
                style: _buildTitleTextStyle(),
              ),
              AppSpacing.spacingVertical8,
            ],
            Container(
              constraints: BoxConstraints(
                maxWidth: width,
              ),
              decoration: const BoxDecoration(
                color: AppColors.light,
                borderRadius: AppBorderRadius.borderRadius14,
                boxShadow: [AppBoxShadow.primary25Blur8],
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: _buildTextStyle(),
                  suffixIcon: suffixIcon != null ? _buildSuffixIcon(): null,
                  suffixIconColor: AppColors.primary,
                  suffixIconConstraints: const BoxConstraints(),
                  suffixText: suffixText,
                  suffixStyle: _buildTextStyle(),
                  contentPadding: AppPadding.paddingHorizontal16,
                  border: InputBorder.none,
                  enabledBorder: AppInputBorder.hiddenBorder,
                  focusedBorder: AppInputBorder.focusedBorder,
                  errorBorder: AppInputBorder.errorBorder,
                  enabled: enabled,
                ),
                keyboardType: inputType,
                style: _buildTextStyle(),
                readOnly: !enabled,
                obscureText: obscureText,
                onChanged: (String value) {
                  _onChanged(formFieldState, value);
                },
                cursorColor: AppColors.secondary,
                onTap: onTap,
                inputFormatters: inputFormatters,
              ),
            ),
            if (formFieldState.hasError) ...[
              AppSpacing.spacingVertical4,
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

  TextStyle _buildTextStyle() {
    switch (enabled) {
      case true:
        return AppTextStyle.robotoRegular14.copyWith(
          color: AppColors.primary,
        );
      default:
      return AppTextStyle.robotoRegular14;
    }
  }

  TextStyle _buildTitleTextStyle() {
    switch (enabled) {
      case true:
        return AppTextStyle.robotoMedium14.copyWith(
          color: AppColors.primary,
        );
      default:
      return AppTextStyle.robotoMedium14;
    }
  }

  Widget _buildSuffixIcon() {
    return InkWell(
      onTap: onSuffixIconPressed,
      child: Padding(
        padding: AppPadding.paddingHorizontal16,
        child: Icon(
          suffixIcon,
          size: ContainerSize.iconSize,
        ),
      ),
    );
  }
}