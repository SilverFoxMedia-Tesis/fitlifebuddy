enum TypeHealthCondition { 
  no('NO', 'No'),
  surgery('SURGERY', 'Cirugía'),
  illness('ILLNESS', 'Enfermedad'),
  diabetes('DIABETES', 'Diabetes');

  const TypeHealthCondition(this.value, this.label);
  final String value;
  final String label;
}