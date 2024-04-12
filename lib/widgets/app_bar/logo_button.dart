import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LogoButton extends StatefulWidget {
  final String icon;
  final String text;
  final void Function()? onTap;

  const LogoButton({
    super.key, 
    required this.icon, 
    required this.text, 
    this.onTap,
  });

  @override
  State<LogoButton> createState() => _LogoButtonState();
}

class _LogoButtonState extends State<LogoButton> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: widget.onTap,
        child: SizedBox(
          width: expanded.value 
            ? ContainerSize.logoButtonExpanded
            : ContainerSize.logoSize,
          child: Row(
            children: [
              SvgPicture.asset(
                widget.icon,
                height: ContainerSize.logoSize,
                fit: BoxFit.contain,
              ),
              if (expanded.value) ...[
                AppSpacing.spacingHorizontal16,
                Text(
                  widget.text,
                  style: AppTextStyle.robotoSemibold20.copyWith(
                    color: AppColors.secondary
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}