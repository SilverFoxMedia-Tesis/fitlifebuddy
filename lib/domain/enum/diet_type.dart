enum DietType { 
  vegan('VEGAN'),
  vegetarian('VEGETARIAN'),
  omnivore('OMNIVORE');

  const DietType(this.value);
  final String value;

  static DietType? fromString(String? str) {
    if (str == null) return null;
    return DietType.values.firstWhere(
      (dt) => dt.value == str,
    );
  }
}