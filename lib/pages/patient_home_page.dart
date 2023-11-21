import 'package:fitlifebuddy/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';

class PatientHomePage extends StatelessWidget {
  const PatientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyAppBar(),
        ],
      )
    );
  }
}