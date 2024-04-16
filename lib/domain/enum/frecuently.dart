enum Frecuently {
  monthly('MONTLY', 'Mensual'), 
  bimonthly('BIMONTLY', 'Bimensual'), 
  quarterly('QUARTERLY', 'Trimestral');

  const Frecuently(this.value, this.label);
  final String value;
  final String label;
}