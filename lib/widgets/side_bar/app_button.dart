import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppButton extends StatelessWidget {
  final String icon;
  final String text;
  final bool enableDarkColor;
  final void Function()? onTap;

  const AppButton({
    super.key, 
    required this.icon, 
    required this.text, 
    this.enableDarkColor = false, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: AppPadding.padding16,
        decoration: BoxDecoration(
          color: _buildColor(),
          boxShadow: const [AppBoxShadow.secondary25Blur8],
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          icon,
          height: ContainerSize.iconSize,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Color _buildColor() {
    return enableDarkColor ? AppColors.secondary : AppColors.primary;
  }
}