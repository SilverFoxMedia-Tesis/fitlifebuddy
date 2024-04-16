enum DietType {
  vegan('VEGAN', 'Vegana'),
  vegetarian('VEGETARIAN', 'Vegetariana'),
  omnivore('OMNIVORE', 'Omnívora');

  const DietType(this.value, this.label);
  final String value;
  final String label;
}