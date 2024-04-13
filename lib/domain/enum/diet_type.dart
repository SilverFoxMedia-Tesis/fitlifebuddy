enum DietType { 
  vegan('VEGAN'),
  vegetarian('VEGETARIAN'),
  omnivore('OMNIVORE');

  const DietType(this.value);
  final String value;
}