enum NotificationType {
  breakfastReminder('Recordatorio de desayuno'),
  lunchReminder('Recordatorio de almuerzo'),
  dinnerReminder('Recordatorio de cena'),
  workoutReminder('Recordatorio de rutina');

  const NotificationType(this.name);
  final String name;
}