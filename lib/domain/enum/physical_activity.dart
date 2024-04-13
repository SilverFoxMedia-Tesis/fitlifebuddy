enum PhysicalActivity {
  no('No'),
  slight('Slight'),
  moderate('Moderate'),
  strong('Strong'),
  veryStrong('Very_Strong');

  const PhysicalActivity(this.value);
  final String value;

  static PhysicalActivity? fromString(String? str) {
    if (str == null) return null;
    return PhysicalActivity.values.firstWhere(
      (pa) => pa.value == str,
    );
  }
}