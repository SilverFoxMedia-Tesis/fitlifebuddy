enum FoodCategory {
  dairyProducts('Dairy_Products', 'Productos Lácteos'),
  fatsOilsShortenings('Fats_Oils_Shortenings', 'Grasas, Aceites, Mantecas'),
  meatPoultry('Meat_Poultry', 'Carne, Aves'),
  fishSeaFood('Fish_Seafood', 'Pescados, Mariscos'),
  vegetablesAE('Vegetables_A_E', 'Verduras A-E'),
  vegetablesFP('Vegetables_F_P', 'Verduras F-P'),
  vegetablesRZ('Vegetables_R_Z', 'Verduras R-Z'),
  fruitsAF('Fruits_A_F', 'Frutas A-F'),
  fruitsGP('Fruits_G_P', 'Frutas G-P'),
  breadsCerealsFastfoodGrains('Breads_cereals_fastfood_grains', 'Pan, Cereales, Comida rápida, Granos'),
  soups('Soups', 'Sopas'),
  seedsAndNuts('Seeds_and_Nuts', 'Semillas y Nueces');

  const FoodCategory(this.value, this.label);
  final String value;
  final String label;
}