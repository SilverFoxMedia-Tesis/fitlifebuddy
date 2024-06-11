enum HealthRisk {
  low('bajo'),
  high('alto'),
  veryHigh('muy alto');

  const HealthRisk(this.name);
  final String name;
}