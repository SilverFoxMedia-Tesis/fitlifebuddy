enum GoalType {
  loseWeight('LOSE_WEIGHT', 'Perder peso'),
  gainMuscle('GAIN_MUSCLE', "Ganar masa muscular");
  
  const GoalType(this.value, this.label);
  final String value;
  final String label;
}