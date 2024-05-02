enum TimeMeal {
  breakfast('Breakfast', 'Desayuno'),
  lunch('Lunch', 'ALmuerzo'),
  dinner('Dinner', 'Cena');

  const TimeMeal(this.value, this.label);
  final String value;
  final String label;
}