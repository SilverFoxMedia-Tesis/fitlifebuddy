enum Frecuency {
  monthly('MONTLY', 'Mensual'), 
  bimonthly('BIMONTLY', 'Bimensual'), 
  quarterly('QUARTERLY', 'Trimestral');

  const Frecuency(this.value, this.label);
  final String value;
  final String label;
}