import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:translation_app/core/constants/app/app_constants.dart';

class LoginService {
  static Future<String> detectLanguage(String message) async {
    final apiKey = ApplicationConstants.LANG_DETECT_API_KEY;
    final response = await http.post(
        Uri.parse(
            "https://translation.googleapis.com/language/translate/v2?target=en&key=$apiKey"),
        body: {
          "q": message,
        });

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final translations = body['data']['translations'] as List;
      final translation = translations.first;

      return translation['detectedSourceLanguage'];
    } else {
      throw Exception();
    }
  }
}
