import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/widgets/app_textfield.dart/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDropdown extends StatelessWidget {
  final int selectedOption;
  final int type;
  final bool readOnly;
  final double width;

  const AppDropdown({
    super.key,
    this. selectedOption = 1,
    this.type = 1,
    this.readOnly = true,
    this.width = 160,
  });

  @override
  Widget build(BuildContext context) {
    final x = buidSelectOption();
    var selectedOption = x.obs;
    return Row(
      children: [
        Obx(
          () => SizedBox(
            width: 160,
            child: Container(
              padding: AppPadding.paddingHorizontal16,
              width: 160,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [AppBoxShadow.primary25Blur8],
              ),
              child: IgnorePointer(
                ignoring: readOnly,
                child: DropdownButtonFormField<String>(
                  value: selectedOption.value,
                  items: buidDropdownItems(),
                  onChanged: (value) {
                    selectedOption.value = value!;
                  },
                  style: buildTextStyle(),
                  focusColor: AppColors.white,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  
                ),
              ),
            ),
          ),
        ),
        AppSpacing.spacingHorizontal24,
        AppTextfield(
          hintText: (type == 1) ? 'Diabetes' : 'Frutos secos',
          readOnly: readOnly,
        )
      ],
    );
  }

  TextStyle buildTextStyle() {
    switch (readOnly) {
      case true:
        return AppTextStyle.robotoSemibold14.copyWith(
          color: AppColors.secondary,
        );
      default:
      return AppTextStyle.robotoSemibold14.copyWith(
          color: AppColors.white,
        );
    }
  }

  List<DropdownMenuItem<String>> buidDropdownItems() {
    switch (type) {
      case 1:
        return [
          const DropdownMenuItem(
            value: 'Enfermedad',
            child: Text('Enfermedad'),
          ),
          const DropdownMenuItem(
            value: 'Cirugía',
            child: Text('Cirugía'),
          ),
        ];
      default:
      return [
          const DropdownMenuItem(
            value: 'Alergia',
            child: Text('Alergia'),
          ),
        ];
    }
  }

  String buidSelectOption() {
    switch (type) {
      case 1:
        return 'Enfermedad';
      default:
      return 'Alergia';
    }
  }
}