import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:flutter/material.dart';

class EmptyResult extends StatelessWidget {
  final String message;
  const EmptyResult({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.paddingOnlyTop24,
      child: Text(
        message,
        style: AppTextStyle.robotoRegular16,
      ),
    );
  }
}