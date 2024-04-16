enum PhysicalActivity {
  no('No', 'Ninguna'),
  slight('Slight', 'Ligera'),
  moderate('Moderate', 'Moderada'),
  strong('Strong', 'Fuerte'),
  veryStrong('Very_Strong', 'Muy Fuerte');

  const PhysicalActivity(this.value, this.label);
  final String value;
  final String label;
}