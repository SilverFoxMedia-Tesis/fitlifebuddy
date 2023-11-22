import 'package:fitlifebuddy/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LauncherPage extends GetResponsiveView {
  final Widget? child;
  LauncherPage({this.child, super.key});

  @override
  Widget builder() {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Row(
          children: [
            const MyAppBar(),
            Flexible(child: child!),
          ],
        ),
      ),
    );
  }
}