import 'package:http/http.dart' as http;

class EmailApi {
  final String baseUrl = 'http://15.228.8.131:8080/api';
  http.Client client = http.Client();

  Uri getUri(String endpoint) {
    return Uri.parse('$baseUrl/$endpoint');
  }

  // Password Recovery
  Future<String> recoverPassword(String email) async {
    final response = await client.post(
      getUri('password/recover?email=$email'),
      headers: _headers(),
    );
    return _handleResponse(response);
  }

  Map<String, String> _headers() => {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    'Accept': '*/*',
  };

  String _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return 'Enviado';
    } else if (response.statusCode == 404) {
      return 'No encontrado';
    } else {
      throw Exception('Failed to fetch data: Status Code: ${response.statusCode}, Body: ${response.body}');
    }
  }
}
