extension EnumExtension on Enum {
  static T? getValue<T extends Enum>(List<T> values, String? str) {
    if (str == null) return null;
    try {
      return values.firstWhere(
        (i) => (i as dynamic).value == str,
      );
    } catch (e) {
      return null;
    }
  }

  static T? getLabel<T extends Enum>(List<T> values, String? str) {
    if (str == null) return null;
    try {
      return values.firstWhere(
        (i) => (i as dynamic).label == str,
      );
    } catch (e) {
      return null;
    }
  }
}