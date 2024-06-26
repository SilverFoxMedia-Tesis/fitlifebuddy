import 'package:http/http.dart' as http;

class BaseApi {
  final String baseUrl = 'http://15.228.8.131:8080/api';
  http.Client client = http.Client();

  Uri getUri(String endpoint) {
    return Uri.parse('$baseUrl/$endpoint');
  }

  // GET request
  Future<http.Response> get(String endpoint) async {
    final response = await client.get(
      getUri(endpoint),
      headers: _headers(),
    );
    return _handleResponse(response);
  }

  // POST request
  Future<http.Response> post(String endpoint, {dynamic body}) async {
    final response = await client.post(
      getUri(endpoint),
      headers: _headers(),
      body: body,
    );
    return _handleResponse(response);
  }

  // PUT request
  Future<http.Response> put(String endpoint, {dynamic body}) async {
    final response = await client.put(
      getUri(endpoint),
      headers: _headers(),
      body: body,
    );
    return _handleResponse(response);
  }

  // DELETE request
  Future<http.Response> delete(String endpoint) async {
    final response = await client.delete(
      getUri(endpoint),
      headers: _headers(),
    );
    return _handleResponse(response);
  }

  Map<String, String> _headers() => {
    'Content-Type': 'application/json',
  };

  http.Response _handleResponse(http.Response response) {
    // print('Response Status: ${response.statusCode}');
    // print('Response Body: ${response.body}');
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      throw Exception('Failed to fetch data: Status Code: ${response.statusCode}, Body: ${response.body}');
    }
  }
}
