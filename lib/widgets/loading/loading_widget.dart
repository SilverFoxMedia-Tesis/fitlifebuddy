import 'package:fitlifebuddy/widgets/loading/loading_indicator.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;
  final bool isLoading;
  final Widget child;

  const LoadingWidget({
    this.color,
    this.size,
    this.isLoading = true,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Expanded(
        child: Center(
          child: LoadingIndicator(
            color: color,
            size: size,
          ),
        ),
      );
    } else {
      return child;
    }
  }
}