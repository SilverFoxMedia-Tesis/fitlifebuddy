import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/api/daily_api.dart';
import 'package:fitlifebuddy/domain/api/exercise_api.dart';
import 'package:fitlifebuddy/domain/api/feedback_api.dart';
import 'package:fitlifebuddy/domain/api/food_api.dart';
import 'package:fitlifebuddy/domain/api/food_condition_api.dart';
import 'package:fitlifebuddy/domain/api/health_condition_api.dart';
import 'package:fitlifebuddy/domain/api/meal_api.dart';
import 'package:fitlifebuddy/domain/api/nutritionist_api.dart';
import 'package:fitlifebuddy/domain/api/option_api.dart';
import 'package:fitlifebuddy/domain/api/patient_api.dart';
import 'package:fitlifebuddy/domain/api/patient_history_api.dart';
import 'package:fitlifebuddy/domain/api/person_api.dart';
import 'package:fitlifebuddy/domain/api/plan_api.dart';
import 'package:fitlifebuddy/domain/api/question_api.dart';
import 'package:fitlifebuddy/domain/api/routine_api.dart';
import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:fitlifebuddy/domain/service/person_service.dart';
import 'package:fitlifebuddy/domain/service/unsplash_service.dart';
import 'package:fitlifebuddy/pages/login_page/login_controller.dart';
import 'package:fitlifebuddy/widgets/app_dialog/getx_dialog.dart';
import 'package:fitlifebuddy/widgets/app_toast/app_toast.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static Future<void> init() async {
    ///Persisted controllers
    Get.lazyPut(() => LoginController(), fenix: true);

    //Dialog
    Get.lazyPut(() => GetXDialog(), fenix: true);

    //Apis
    Get.lazyPut(() => BaseApi(), fenix: true);
    Get.lazyPut(() => DailyApi(), fenix: true);
    Get.lazyPut(() => ExerciseApi(), fenix: true);
    Get.lazyPut(() => FeedbackApi(), fenix: true);
    Get.lazyPut(() => FoodApi(), fenix: true);
    Get.lazyPut(() => FoodConditionApi(), fenix: true);
    Get.lazyPut(() => HealthConditionApi(), fenix: true);
    Get.lazyPut(() => MealApi(), fenix: true);
    Get.lazyPut(() => NutritionistApi(), fenix: true);
    Get.lazyPut(() => OptionApi(), fenix: true);
    Get.lazyPut(() => PatientApi(), fenix: true);
    Get.lazyPut(() => PatientHistoryApi(), fenix: true);
    Get.lazyPut(() => PersonApi(), fenix: true);
    Get.lazyPut(() => PlanApi(), fenix: true);
    Get.lazyPut(() => QuestionApi(), fenix: true);
    Get.lazyPut(() => RoutineApi(), fenix: true);

    //Services
    Get.lazyPut(() => FormValidationService(), fenix: true);
    Get.lazyPut(() => UnsplashService(), fenix: true);
    Get.lazyPut(() => PatientService(), fenix: true);

    Get.lazyPut(() => AppToast(), fenix: true);
  }
}