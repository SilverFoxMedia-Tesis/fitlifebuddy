enum MealTime {
  breakfast('Breakfast', 'Desayuno'),
  lunch('Lunch', 'Almuerzo'),
  dinner('Dinner', 'Cena');

  const MealTime(this.value, this.label);
  final String value;
  final String label;
}