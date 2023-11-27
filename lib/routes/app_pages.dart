import 'package:fitlifebuddy/pages/login_page/login_page.dart';
import 'package:fitlifebuddy/pages/meal_page.dart';
import 'package:fitlifebuddy/pages/nutritionist_home_page.dart';
import 'package:fitlifebuddy/pages/nutritionist_profile_page.dart';
import 'package:fitlifebuddy/pages/patient_home_page.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/patient_profile_page.dart';
import 'package:fitlifebuddy/pages/patients_page/patients_page.dart';
import 'package:fitlifebuddy/pages/plan_page/plan_page.dart';
import 'package:fitlifebuddy/pages/plan_page/plan_page_2.dart';
import 'package:fitlifebuddy/pages/recover_password_page/recover_password_page.dart';
import 'package:fitlifebuddy/pages/register_patient_page/register_patient_page.dart';
import 'package:fitlifebuddy/pages/register_patient_page/succesful_register_page.dart';
import 'package:fitlifebuddy/pages/routine_page.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:get/get.dart';

final appPages = [
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginPage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.recoverPassword,
    page: () => const RecoverPasswordPage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.pacientHome,
    page: () => const PatientHomePage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.nutritionistHome,
    page: () => const NutritionistHomePage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.register,
    page: () => const RegisterPatientPage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.pacientProfile,
    page: () => const PatientProfilePage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.plan,
    page: () => const PlanPage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.meal,
    page: () => const MealPage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.routine,
    page: () => const RoutinePage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.nutritionistProfile,
    page: () => const NutritionistProfilePage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.patients,
    page: () => const PatientsPage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.registerPacient,
    page: () => const RegisterPatientPage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.successfulRegister,
    page: () => const SuccesfulRegisterPage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.plan2,
    page: () => const PlanPage2(),
    transition: Transition.noTransition,
  ),
];