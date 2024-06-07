enum BMICategory {
  underweight('Underweight', 'Bajo de peso'),
  normalweight('Normal_Weight', 'Peso normal'),
  overweight('Overweight', 'Sobrepeso'),
  obesityTypeI('Obesity_Type_I', 'Obesidad Tipo I'),
  obesityTypeII('Obesity_Type_II', 'Obesidad Tipo II'),
  obesityTypeIII('Obesity_Type_III', 'Obesidad Tipo III');

  const BMICategory(this.value, this.label);
  final String value;
  final String label;
}