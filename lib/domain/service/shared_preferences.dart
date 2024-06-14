import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _prefs;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Método interno para obtener la instancia
  static SharedPreferences _getInstance() {
    if (_prefs == null) {
      throw Exception(
        'SharedPreferences no ha sido inicializado. Llama al método initialize primero.',
      );
    }
    return _prefs!;
  }

  // Setter para el ID del paciente
  static Future<void> setPatientId(String patientId) async {
    await _getInstance().setString('patientId', patientId);
  }

  // Getter para el ID del paciente
  static String? getPatientId() {
    return _getInstance().getString('patientId');
  }

  // Setter para el ID del usuario
  static Future<void> setPersonId(String personId) async {
    await _getInstance().setString('personId', personId);
  }

  // Getter para el ID del usuario
  static String? getPersonId() {
    return _getInstance().getString('personId');
  }
}
