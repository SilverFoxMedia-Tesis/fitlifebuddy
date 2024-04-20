import 'package:fitlifebuddy/pages/login_page/login_binding.dart';
import 'package:fitlifebuddy/pages/login_page/login_page.dart';
import 'package:fitlifebuddy/pages/meal_page/meal_page.dart';
import 'package:fitlifebuddy/pages/patient_home_page.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/patient_profile_binding.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/patient_profile_page.dart';
import 'package:fitlifebuddy/pages/patients_page/patients_page.dart';
import 'package:fitlifebuddy/pages/plan_page/plan_binding.dart';
import 'package:fitlifebuddy/pages/plan_page/plan_page.dart';
import 'package:fitlifebuddy/pages/recover_password_page/recover_password_binding.dart';
import 'package:fitlifebuddy/pages/recover_password_page/recover_password_page.dart';
import 'package:fitlifebuddy/pages/register_patient_page/register_patient_binding.dart';
import 'package:fitlifebuddy/pages/register_patient_page/register_patient_page.dart';
import 'package:fitlifebuddy/pages/register_patient_page/succesful_register_page.dart';
import 'package:fitlifebuddy/pages/routine_page/routine_page.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:get/get.dart';

final appPages = [
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginPage(),
    binding: LoginBinding(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.recoverPassword,
    page: () => const RecoverPasswordPage(),
    binding: RecoverPasswordBinding(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.home,
    page: () => const PatientHomePage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.registerPatient,
    page: () => RegisterPatientPage(),
    transition: Transition.noTransition,
    binding: RegisterPatientBinding(),
  ),
  GetPage(
    name: AppRoutes.profile,
    page: () => const PatientProfilePage(),
    transition: Transition.noTransition,
    binding: PatientProfileBinding(),
  ),
  GetPage(
    name: AppRoutes.plan,
    page: () => const PlanPage(),
    transition: Transition.noTransition,
    binding: PlanBinding(),
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
    name: AppRoutes.patients,
    page: () => const PatientsPage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.registerPatient,
    page: () => RegisterPatientPage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.successfulRegister,
    page: () => const SuccesfulRegisterPage(),
    transition: Transition.noTransition,
  ),
];