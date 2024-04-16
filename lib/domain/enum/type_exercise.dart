enum TypeExercise {
  upperChest('Upper_Chest', 'Pecho superior'),
  lowerChest('Lower_Chest', 'Pecho inferior'),
  chestIsolation('Chest_Isolation', 'Aislamiento de pecho'),
  upper('Upper', 'Superior'),
  lower('Lower', 'Inferior'),
  biceps('Biceps', 'Bíceps'),
  triceps('Triceps', 'Tríceps'),
  quadriceps('Quadriceps', 'Cuádriceps'),
  hamstrings('Hamstrings', 'Isquiotibiales'),
  glutes('Glutes', 'Glúteos'),
  calves('Calves', 'Pantorrillas'),
  anterior('Anterior', 'Anterior'),
  lateral('Lateral', 'Lateral'),
  posterior('Posterior', 'Posterior'),
  middle('Middle', 'Medio'),
  wristFlexors('Wrist_Flexors', 'Flexores de muñeca'),
  wristExtensors('Wrist_Extensors', 'Extensores de muñeca'),
  gripStrength('Grip_Strength', 'Fuerza de agarre');

  const TypeExercise(this.value, this.label);
  final String value;
  final String label;
}