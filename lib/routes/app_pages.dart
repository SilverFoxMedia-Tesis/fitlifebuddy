import 'package:fitlifebuddy/pages/login_page.dart';
import 'package:fitlifebuddy/pages/meal_page.dart';
import 'package:fitlifebuddy/pages/nutritionist_home_page.dart';
import 'package:fitlifebuddy/pages/nutritionist_profile_page.dart';
import 'package:fitlifebuddy/pages/patient_home_page.dart';
import 'package:fitlifebuddy/pages/patient_profile_page.dart';
import 'package:fitlifebuddy/pages/patients_page.dart';
import 'package:fitlifebuddy/pages/plan_page.dart';
import 'package:fitlifebuddy/pages/register_page.dart';
import 'package:fitlifebuddy/pages/routine_page.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:get/get.dart';

final appPages = [
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginPage(),
  ),
  GetPage(
    name: AppRoutes.recoverAccount,
    page: () => const LoginPage(),
  ),
  GetPage(
    name: AppRoutes.pacientHome,
    page: () => const PatientHomePage(),
    children: _patientChildren,
  ),
  GetPage(
    name: AppRoutes.nutritionistHome,
    page: () => const NutritionistHomePage(),
    children: _nutritionistChildren,
  ),
  GetPage(
    name: AppRoutes.register,
    page: () => const RegisterPage(),
  ),
];

final _patientChildren = [
  GetPage(
    name: AppRoutes.pacientProfile,
    page: () => const PatientProfilePage(),
  ),
  GetPage(
    name: AppRoutes.plan,
    page: () => const PlanPage(),
    children: _planChildren,
  ),
];

final _planChildren = [
  GetPage(
    name: AppRoutes.meal,
    page: () => const MealPage(),
  ),
  GetPage(
    name: AppRoutes.routine,
    page: () => const RoutinePage(),
  ),
];

final _nutritionistChildren = [
  GetPage(
    name: AppRoutes.nutritionistProfile,
    page: () => const NutritionistProfilePage(),
  ),
  GetPage(
    name: AppRoutes.patients,
    page: () => const PatientsPage(),
  ),
  GetPage(
    name: AppRoutes.registerPacient,
    page: () => const RegisterPage(),
  ),
];