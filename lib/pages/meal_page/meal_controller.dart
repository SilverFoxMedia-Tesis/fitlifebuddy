import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/maps.dart';
import 'package:fitlifebuddy/domain/model/food.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/domain/service/plan_service.dart';
import 'package:fitlifebuddy/pages/meal_page/widgets/change_meal_card.dart';
import 'package:fitlifebuddy/pages/meal_page/widgets/food_card.dart';
import 'package:fitlifebuddy/widgets/app_dialog/getx_dialog.dart';
import 'package:get/get.dart';

class MealController extends GetxController {
  final getXDialog = Get.find<GetXDialog>();
  final planService = Get.find<PlanService>();
  final dateTime = DateTime.now().obs;
  final currentMeal = Meal().obs;

  bool get hasFoods => currentMeal.value.foods?.isNotEmpty ?? false;
  String get fullname => currentMeal.value.fullname ?? '';
  String get timeMeal => currentMeal.value.timeMeal?.label ?? '';

  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    dateTime(planService.currentDailyDateTime.value);
    if (planService.currentMeal != null) {
      currentMeal(planService.currentMeal!);
    }
  }

  String getMealDate() {
    return fromDateToLong(dateTime.value);
  }

  Future<void> openChangeMealDialog() async {
    var timeMeal = currentMeal.value.timeMeal;
    await getXDialog.showDialog(ChangeMealCard(timeMeal: timeMeal), onClose: onDialogClose);
  }

  void changeMealToCompleted() {

  }

  Future<void> viewFoodInformation(Food food) async {
    await getXDialog.showDialog(FoodCard(food: food), onClose: onDialogClose);
  }

  String translatedWord(int idFood) {
    return translateFood(idFood);
  }

  bool onDialogClose() {
    Get.back();
    return true;
  }
}