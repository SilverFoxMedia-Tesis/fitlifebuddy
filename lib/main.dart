import 'package:fitlifebuddy/domain/dependency_injection.dart';
import 'package:fitlifebuddy/domain/provider/localization/languages.dart';
import 'package:fitlifebuddy/domain/service/shared_preferences.dart';
import 'package:fitlifebuddy/routes/app_pages.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main({Widget? page}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.initialize();
  await Languages.init();
  await DependencyInjection.init();
  await initializeDateFormatting('es', null);
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
      fallbackLocale: const Locale('es', 'ES'),
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        shadowColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.light(
          primary: Colors.blueAccent,
        ),
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: child!,
      ),
      initialRoute: AppRoutes.login,
      getPages: appPages,
    );
  }
}