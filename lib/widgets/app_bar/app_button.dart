import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final String icon;
  final String text;
  final num? colorNumber;
  final void Function()? onTap;

  const AppButton({
    super.key, 
    required this.icon, 
    required this.text, 
    this.colorNumber, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: onTap,
        child: Container(
          padding: AppPadding.padding16,
          width: expanded.value ? 176 : 56,
          decoration: BoxDecoration(
            color: _getColor(colorNumber),
            borderRadius: expanded.value ? AppBorderRadius.borderRadiusXxl : null,
            boxShadow: const [AppBoxShadow.secondary25Blur8],
            shape: expanded.value ? BoxShape.rectangle : BoxShape.circle,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                height: ContainerSize.iconSize,
                fit: BoxFit.fitHeight,
              ),
              if (expanded.value) ...[
                AppSpacing.spacingHorizontal16,
                Text(
                  text,
                  style: AppTextStyle.robotoMedium14.copyWith(
                    color: AppColors.white,
                  )
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Color _getColor(num? colorNumber) {
    switch (colorNumber) {
      case 1:
        return AppColors.secondary;
      default:
        return AppColors.primary;
    }
  }
}