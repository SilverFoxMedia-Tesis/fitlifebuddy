import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/meal_page/widgets/change_meal_card.dart';
import 'package:fitlifebuddy/pages/meal_page/widgets/food_card.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_item_card.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealPage extends StatelessWidget {
  const MealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: Padding(
        padding: AppPadding.paddingPage,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Desayuno |',
                        style: AppTextStyle.robotoSemibold34.copyWith(
                          color: AppColors.secondary
                        ),
                      ),
                      AppSpacing.spacingHorizontalLg,
                      Text(
                        'Miércoles, 15 de Noviembre',
                        style: AppTextStyle.robotoRegular34.copyWith(
                          color: AppColors.primary
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BaseButtom(
                        text: 'Cambiar',
                        onTap: () {
                        Get.dialog(
                          Dialog(
                            backgroundColor: AppColors.secondary.withOpacity(0.5),
                            child: const ChangeMealCard(),
                          ),
                        );
                      },
                        color: AppColors.warning,
                        width: 160,
                      ),
                      AppSpacing.spacingHorizontalLg,
                      BaseButtom(
                        text: 'Completado',
                        onTap: () {},
                        color: AppColors.secondary,
                        width: 160,
                      ),
                    ],
                  ),
                ],
              ),
              AppSpacing.spacingVerticalXxl,
              Text(
                'Tostada con palta y huevo',
                style: AppTextStyle.robotoSemibold24.copyWith(
                  color: AppColors.secondary
                ),
              ),
              AppSpacing.spacingVerticalXxl,
              Text(
                'Disfruta de una exquisita tostada con huevo frito y palta, una combinación perfecta para comenzar el día con energía. Esta delicia consiste en una tostada crujiente y dorada, cubierta con un huevo frito de yema cremosa y clara  cocida. Acompañando al huevo, encontrarás rodajas de palta fresca y suave, que le aportan un toque de frescura y cremosidad.',
                style: AppTextStyle.robotoRegular20.copyWith(
                  color: AppColors.secondary
                ),
              ),
              AppSpacing.spacingVerticalXxl,
              Text(
                'Ingredientes:',
                style: AppTextStyle.robotoSemibold24.copyWith(
                  color: AppColors.secondary
                ),
              ),
              AppSpacing.spacingVerticalXxl,
              SizedBox(
                width: 824,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  shrinkWrap: true,
                  childAspectRatio: 3,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.dialog(
                          Dialog(
                            backgroundColor: AppColors.secondary.withOpacity(0.5),
                            child: const FoodCard(),
                          ),
                        );
                      },
                      child: const PlanItemCard(
                        text: 'Huevo frito', 
                        image: AppIcons.food1
                      )
                    ),
                    const PlanItemCard(text: 'Palta', image: AppIcons.food2),
                    const PlanItemCard(text: 'Tostada', image: AppIcons.food3),
                  ],
                ),
              ),
              AppSpacing.spacingVerticalXxl,
              Text(
                'Preparación:',
                style: AppTextStyle.robotoSemibold24.copyWith(
                  color: AppColors.secondary
                ),
              ),
              AppSpacing.spacingVerticalXxl,
              Text(
                '''- Tuesta una rebanada de pan hasta que esté crujiente y dorada.\n\n- Mientras tanto, corta una palta madura por la mitad y retira el hueso. Con una cuchara, extrae la pulpa de la palta y colócala en un bol pequeño.\n\n- Con un tenedor, machaca la palta hasta obtener una consistencia suave. Puedes agregar sal y pimienta al gusto para sazonarla.\n\n- En una sartén antiadherente, calienta un poco de aceite o mantequilla a fuego medio. Rompe un huevo en la sartén y cocínalo a tu gusto: puedes hacerlo frito, a punto de nieve o como prefieras.\n\n- Mientras se cocina el huevo, unta generosamente la palta machacada sobre la rebanada de pan tostado.\n\n- Una vez que el huevo esté listo, colócalo cuidadosamente sobre la capa de palta en la tostada.\n\n- Opcionalmente, puedes sazonar el huevo con sal y pimienta adicional, así como añadir otros ingredientes como hojas de rúcula, tomate cortado en rodajas o incluso un poco de salsa picante para darle un toque extra de sabor.''',
                style: AppTextStyle.robotoRegular20.copyWith(
                  color: AppColors.secondary
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}