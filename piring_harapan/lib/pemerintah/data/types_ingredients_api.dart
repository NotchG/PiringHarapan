import 'package:flutter/services.dart';

class TypesIngredientsAPI {
  static Future<String> getIngredients() async {
    try {
      String data =
          await rootBundle.loadString('assets/data/TYPES_INGREDIENTS.json');
      print("JSON Loaded Successfully"); // Tambahkan ini untuk debugging
      return data;
    } catch (e) {
      print("Error loading JSON: $e"); // Debugging jika gagal
      return "[]"; // Pastikan tetap mengembalikan JSON kosong jika gagal
    }
  }
}
