import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/recipe_model.dart';

class AiMenuController {
  Future<List<Recipe>?> fetchChatCompletion(
      List<Map<String, String>> messages) async {
    const String apiUrl = "https://api.groq.com/openai/v1/chat/completions";
    const String apiKey = ""; // Replace with your API key

    final Map<String, dynamic> requestBody = {
      "messages": messages,
      "model": "llama-3.2-90b-vision-preview",
      "temperature": 1.3,
      "max_completion_tokens": 1024,
      "top_p": 1,
      "stream": false,
      "response_format": {"type": "json_object"},
      "stop": null
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey",
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResult = jsonDecode(response.body);
        List<dynamic> result = jsonResult["choices"];
        List<dynamic> data =
            jsonDecode(result[0]["message"]["content"])["menu"];
        return data.map((json) => Recipe.fromJson(json)).toList();
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
        if (response.statusCode == 429) {
          throw Exception("Rate limit has been reached.");
        }
        return await fetchChatCompletion(messages);
      }
    } catch (e) {
      print("Exception: $e");
      return await fetchChatCompletion(messages);
    }
  }
}
