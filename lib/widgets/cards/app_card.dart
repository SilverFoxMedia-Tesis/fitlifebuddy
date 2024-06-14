import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/box_decoration.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCard extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final void Function()? onTap;

  const AppCard({
    super.key, 
    required this.title, 
    required this.description, 
    required this.icon, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: AppPadding.padding32,
        height: ContainerSize.appCardHeight,
        constraints: const BoxConstraints(maxWidth: ContainerSize.appCardWidth),
        decoration: AppBoxDecoration.lightRadius14,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.robotoSemibold20,
                  ),
                  AppSpacing.spacingVertical8,
                  Text(
                    description,
                    style: AppTextStyle.robotoMedium14.copyWith(
                      color: AppColors.primary,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: AppPadding.paddingHorizontal16,
              child: SvgPicture.asset(
                icon,
                height: ContainerSize.appCardIconSize,
                fit: BoxFit.fitHeight,
                colorFilter: const ColorFilter.mode(AppColors.secondary, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}