//Nota: Los key deben tener max. 20 carateres
// Debido los servicios create Food/Health condition

enum Surgery {
  bariatricSurgery('Bariatric surgery', 'Cirugía bariátrica (bypass gástrico, manga gástrica, etc.)'),
  kneeReplacement('Knee replacement', 'Cirugía de reemplazo de rodilla'),
  hipReplacement('Hip replacement', 'Cirugía de reemplazo de cadera'),
  herniaRepair('Hernia repair', 'Cirugía de reparación de hernia'),
  gallbladderSurgery('Gallbladder surgery', 'Cirugía de vesícula biliar'),
  breastConstruction('BreastreConstruction', 'Cirugía de reconstrucción mamaria'),
  sleepApneaSurgery('Sleep apnea surgery', 'Cirugía de apnea del sueño');

  const Surgery(this.value, this.label);
  final String value;
  final String label;
}

enum Illness {
  type2Diabetes('Type 2 diabetes', 'Diabetes tipo 2'),
  hypertension('Hypertension', 'Hipertensión arterial'),
  cardioDisease('Cardio diseases', 'Enfermedades cardiovasculares'),
  sleepApnea('Sleep apnea', 'Apnea del sueño'),
  cancer('Cancer', 'Cáncer (de mama, colon, endometrio, riñón y vesícula biliar)'),
  osteoarthritis('Osteoarthritis', 'Osteoartritis'),
  fattyLiver('Fatty liver', 'Hígado graso no alcohólico'),
  infertility('Infertility', 'Infertilidad'),
  depression('Depression', 'Depresión'),
  stroke('Stroke', 'Accidente cerebrovascular');

  const Illness(this.value, this.label);
  final String value;
  final String label;
}