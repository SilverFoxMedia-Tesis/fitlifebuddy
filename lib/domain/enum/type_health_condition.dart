enum TypeHealthCondition { 
  surgery('SURGERY', 'Cirugía'),
  illness('ILLNESS', 'Enfermedad');

  const TypeHealthCondition(this.value, this.label);
  final String value;
  final String label;
}