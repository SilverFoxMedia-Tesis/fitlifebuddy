enum Gender { 
  male('MALE', 'Masculino'),
  female('FEMALE', 'Femenino');

  const Gender(this.value, this.label);
  final String value;
  final String label;

  static Gender? fromString(String? str) {
    if (str == null) return null;
    return Gender.values.firstWhere(
      (g) => g.value == str,
    );
  }

  static Gender? fromLabel(String? str) {
    if (str == null) return null;
    return Gender.values.firstWhere(
      (g) => g.label == str,
    );
  }
}