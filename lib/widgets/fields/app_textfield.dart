import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/input_border.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/core/utils/input_formatters.dart';
import 'package:fitlifebuddy/core/utils/input_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppTextField extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? suffixText;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final double? width;
  final bool enabled;
  final bool obscureText;
  final TextInputType? inputType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    super.key,
    required this.title,
    this.hintText,
    this.controller,
    this.validator,
    this.suffixText,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.width = ContainerSize.baseContainerdWidth, //TODO: corregir
    this.enabled = true,
    this.obscureText = false,
    this.inputType,
    this.maxLength,
    this.inputFormatters,
  });

  factory AppTextField.textField({
    required String title,
    TextEditingController? controller,
    bool? enabled,
    TextInputType? inputType,
  }) {
    return AppTextField(
      title: title,
      controller: controller,
      validator: validateLettersOnly,
      enabled: enabled ?? true,
      inputType: inputType ?? TextInputType.text,
      inputFormatters: InputFormatters.lettersOnly,
    );
  }

  factory AppTextField.numberField({
    required String title,
    TextEditingController? controller,
    String? suffixText,
    double? width,
    bool? enabled,
  }) {
    return AppTextField(
      title: title,
      controller: controller,
      validator: validateWeightAndHeight,
      suffixText: suffixText,
      width: width ?? ContainerSize.baseContainerdWidth, //TODO: corregir
      enabled: enabled ?? true,
      inputType: TextInputType.number,
      maxLength: 3,
      inputFormatters: InputFormatters.numbersOnly,
    );
  }

  factory AppTextField.emailField({
    required String title,
    TextEditingController? controller,
    bool? enabled,
  }) {
    return AppTextField(
      title: title,
      controller: controller,
      validator: validateRequiredEmail,
      enabled: enabled ?? true,
      inputType: TextInputType.emailAddress,
    );
  }

  factory AppTextField.passwordField({
    required String title,
    TextEditingController? controller,
    required bool obscureText,
    Function()? onSuffixIconPressed,
  }) {
    return AppTextField(
      title: title,
      controller: controller,
      validator: validatePassword,
      obscureText: obscureText,
      suffixIcon: obscureText
        ? Icons.remove_red_eye_rounded
        : Icons.visibility_off_rounded,
      onSuffixIconPressed: onSuffixIconPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: _buildTitleTextStyle(),
        ),
        AppSpacing.spacingVertical8,
        FormBuilderTextField(
          name: title,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            // hint text
            hintText: hintText,
            hintStyle: _buildTextStyle(),
            // error text
            errorStyle: AppTextStyle.robotoRegular14.copyWith(
              color: AppColors.danger,
            ),
            // padding
            contentPadding: AppPadding.paddingHorizontal16,
            // suffix icon
            suffixIcon: suffixIcon != null ? _buildSuffixIcon(): null,
            suffixIconColor: AppColors.primary,
            suffixIconConstraints: const BoxConstraints(),
            // suffix text
            suffixText: suffixText,
            suffixStyle: _buildTextStyle(),
            // background color
            filled: true,
            fillColor: AppColors.light,
            // border
            errorBorder: AppInputBorder.errorBorder,
            focusedBorder: AppInputBorder.focusedBorder,
            focusedErrorBorder: AppInputBorder.errorBorder,
            disabledBorder: AppInputBorder.hiddenBorder,
            enabledBorder: AppInputBorder.hiddenBorder,
            border: AppInputBorder.hiddenBorder,
            // constrains
            constraints: BoxConstraints(
              maxWidth: width ?? double.infinity,
            ),
          ),
          enabled: enabled,
          readOnly: !enabled,
          obscureText: obscureText,
          keyboardType: inputType,
          style: _buildTextStyle(),
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          cursorColor: AppColors.primary,
        ),
      ],
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