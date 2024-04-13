enum Gender { 
  male('MALE'),
  female('FEMALE');

  const Gender(this.value);
  final String value;

  static Gender? fromString(String? str) {
    if (str == null) return null;
    return Gender.values.firstWhere(
      (g) => g.value == str,
    );
  }
}