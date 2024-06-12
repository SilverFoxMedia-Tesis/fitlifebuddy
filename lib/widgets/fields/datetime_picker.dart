import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/input_border.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final DateTime? initialDate;
  final Function(DateTime?)? onChanged;
  final double? width;
  final bool enabled;

  const DateTimePicker({
    super.key,
    required this.title,
    this.controller,
    this.initialDate,
    this.onChanged,
    this.width = ContainerSize.baseContainerWidth, //TODO: corregir
    this.enabled = true,
  });

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
        FormBuilderDateTimePicker(
          name: title,
          controller: controller,
          initialDate: initialDate,
          initialValue: initialDate,
          onChanged: onChanged,
          validator: (value) {
            if (value == null) return "validator_empty".tr;
            return null;
          },
          inputType: InputType.date,
          format: DateFormat(DateFormats.birthdate, 'es'),
          lastDate: DateTime.now(),
          decoration: InputDecoration(
            // hint text
            hintText:  controller?.text != '' ? controller?.text : "Seleccionar fecha",
            hintStyle: _buildTextStyle(),
            // error text
            errorStyle: AppTextStyle.robotoRegular14.copyWith(
              color: AppColors.danger,
            ),
            // padding
            contentPadding: AppPadding.paddingHorizontal16,
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
          keyboardType: TextInputType.datetime,
          style: _buildTextStyle(),
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
}