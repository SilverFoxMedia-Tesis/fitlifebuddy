import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/widgets/side_bar/side_bar.dart';
// ignore: unused_import
import 'package:fitlifebuddy/widgets/cover/cover.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LauncherPage extends GetResponsiveView {
  final Widget? child;
  final bool isLogged;
  LauncherPage({
    super.key,
    this.child,
    this.isLogged = true,
  });

  @override
  Widget builder() {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Row(
          children: [
            if (isLogged) const SideBar(),
            Flexible(child: child!),
          ],
        ),
        backgroundColor: AppColors.background,
      ),
    );
  }
}