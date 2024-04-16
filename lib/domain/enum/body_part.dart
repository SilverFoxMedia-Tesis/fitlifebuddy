enum BodyPart {
  chest('Chest', 'Pecho'),
  back('Back', 'Espalda'),
  arms('Arms', 'Brazos'),
  legs('Legs', 'Piernas'),
  shoulders('Shoulders', 'Hombros'),
  abs('Abs', 'Abdominales'),
  forearms('Forearms', 'Antebrazos');

  const BodyPart(this.value, this.label);
  final String value;
  final String label;
}