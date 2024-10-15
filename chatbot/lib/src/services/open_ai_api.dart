import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class OpenAiApi {
  final String key = "Api key"; //
  final String apiUrl = 'url to open api ';

  Future<String?> getResponse(String input) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $key',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'user', 'content': input}
        ],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Response: ${response.body}');
      return data['choices'][0]['message']['content'];
    } else {
      print('Error: ${response.body}');
      throw Exception('Failed to load response');
    }
  }
}
