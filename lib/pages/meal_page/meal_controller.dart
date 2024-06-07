import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/core/utils/maps.dart';
import 'package:fitlifebuddy/domain/api/daily_api.dart';
import 'package:fitlifebuddy/domain/api/meal_api.dart';
import 'package:fitlifebuddy/domain/enum/status.dart';
import 'package:fitlifebuddy/domain/model/food.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/domain/service/plan_service.dart';
import 'package:fitlifebuddy/pages/meal_page/widgets/change_meal_dialog.dart';
import 'package:fitlifebuddy/pages/meal_page/widgets/food_information_dialog.dart';
import 'package:fitlifebuddy/widgets/app_dialog/getx_dialog.dart';
import 'package:get/get.dart';

class MealController extends GetxController {
  final getXDialog = Get.find<GetXDialog>();
  final mealApi = Get.find<MealApi>();
  final dailyApi = Get.find<DailyApi>();
  final planService = Get.find<PlanService>();
  final currentMeal = Meal().obs;
  final availableMeals = <Meal>[].obs;

  bool get hasFoods => currentMeal.value.foods?.isNotEmpty ?? false;
  int get foodsLength => currentMeal.value.foods?.length ?? 0;
  String get fullname => currentMeal.value.fullname ?? '';
  String get timeMeal => currentMeal.value.timeMeal?.label ?? '';

  final isChanging = false.obs;

  String get currentDateTime => fromDateToLong(planService.currentDailyDateTime.value);
  bool get completed => planService.currentDaily.value.status?.label == Status.completed.label;

  final loading = false.obs;

  var selectedId = 0;
  final mealSelected = Meal().obs;
  final isSelected = false.obs;

  bool get hasOptions => availableMeals.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    try {
      loading(true);
      currentMeal(planService.currentMeal);
      currentMeal.value.foods?.forEach((food) {
        food.imageUrl = foodsURLMap[food.id];
      });
    } catch (e) {
      displayErrorToast(e);
    } finally {
      loading(false);
    }
  }

  
  Future<void> changeMealToCompleted() async {
    try {
      isChanging(true);
      final daily = planService.currentDaily.value;
      if (daily.id != null) {
        daily.status = Status.completed;
        await dailyApi.updateDaily(daily.id!, daily);
        planService.setDaily(daily);
      }
    } catch (e) {
      displayErrorToast(e);
    } finally {
      isChanging(false);
    }
  }

  Future<void> openFoodInformationDialog(Food food) async {
    await getXDialog.showDialog(FoodInformationDialog(food: food), onClose: onDialogClose);
  }

  Future<void> openChangeMealDialog() async {
    //TODO: cargar opciones
    await getXDialog.showDialog(const ChangeMealDialog(), onClose: onDialogClose);
  }


  void onMealSelected(Meal meal) {
    isSelected.value = true;
    mealSelected.value = meal;
  }

  String translatedWord(int idFood) {
    return translateFood(idFood);
  }

  bool onDialogClose() {
    Get.back();
    return true;
  }
}