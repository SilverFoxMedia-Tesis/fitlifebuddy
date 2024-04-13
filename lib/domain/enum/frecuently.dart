enum Frecuently {
  monthly('MONTHLY'), 
  bimonthly('BIMONTHLY'), 
  quarterly('QUARTERLY'),;

  const Frecuently(this.value);
  final String value;

  static Frecuently? fromString(String? str) {
    if (str == null) return null;
    return Frecuently.values.firstWhere(
      (f) => f.value == str,
    );
  }
}