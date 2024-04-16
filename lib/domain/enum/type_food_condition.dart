enum TypeFoodCondition { 
  preference('PREFERENCE', 'Preferencia'), 
  restriction('RESTRICTION', 'Restricción'),
  allergy('ALLERGY', 'Alergia'),;

  const TypeFoodCondition(this.value, this.label);
  final String value;
  final String label;
}