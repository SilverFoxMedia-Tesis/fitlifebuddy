import 'package:fitlifebuddy/domain/provider/localization/languages.dart';
import 'package:fitlifebuddy/routes/app_pages.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main({Widget? page}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Languages.init();
  runApp(page ?? const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('es', 'PE'),
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        shadowColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.login,
      getPages: appPages,
    );
  }
}