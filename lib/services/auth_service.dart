import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String _baseUrl = 'http://127.0.0.1:8000/pet/users/';

  // Login function with error handling and basic validation
  static Future<Map<String, dynamic>?> login(String email, String password) async {
    // Basic validation
    if (email.isEmpty || password.isEmpty) {
      print("Email or password is empty.");
      return null;
    }

    final url = Uri.parse('$_baseUrl/login/');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Login successful: $data');
        return data; // Login success: return the user data or token
      } else if (response.statusCode == 400) {
        print('Bad request: ${response.body}');
        return null;
      } else if (response.statusCode == 401) {
        print('Unauthorized: Incorrect email or password');
        return null;
      } else {
        print('Login failed: ${response.statusCode}');
        print(response.body);
        return null;
      }
    } catch (e) {
      print('Exception during login: $e');
      return null;
    }
  }
}
