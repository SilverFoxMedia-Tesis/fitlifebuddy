enum Gender { 
  male('MALE', 'Masculino'),
  female('FEMALE', 'Femenino');

  const Gender(this.value, this.label);
  final String value;
  final String label;
}