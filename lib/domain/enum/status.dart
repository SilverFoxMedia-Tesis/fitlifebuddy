enum Status {
  actived('ACTIVED', 'Activo'),
  canceled('CANCELED', 'Cancelado'),
  completed('COMPLETED', 'Completado'),
  unfilled('UNFILLED', 'Pendiente'),
  stopped('STOPPED', 'Detenido');

  const Status(this.value, this.label);
  final String value;
  final String label;
}