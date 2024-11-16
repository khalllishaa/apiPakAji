import 'dart:convert';
import 'package:apipakaji/makeupp/PostModell.dart';
import 'package:http/http.dart' as http;

class ApiServicee {
  final String baseUrl = 'https://mediadwi.com/api/latihan';

  // Metode POST untuk register
  Future<PostModell> register(String username, String password, String fullName, String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register-user'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
        'full_name': fullName,
        'email': email,
      }),
    );

    print('Response Status Code: ${response.statusCode}'); // Debug status code
    print('Response body: ${response.body}'); // Debug body response

    if (response.statusCode == 200) {
      return PostModell.fromJson(json.decode(response.body));
    } else {
      print('Error: ${response.body}');
      throw Exception('Register failed');
    }
  }
}
