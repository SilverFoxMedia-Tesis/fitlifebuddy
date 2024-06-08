enum FoodConditionType { 
  preference('PREFERENCE', 'Preferencia'), 
  restriction('RESTRICTION', 'Restricción'),
  allergy('ALLERGY', 'Alergia'),;

  const FoodConditionType(this.value, this.label);
  final String value;
  final String label;
}