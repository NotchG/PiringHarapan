import 'package:flutter/services.dart';

class TypesIngredientsAPI {
  static Future<String> getIngredients() async {
    try {
      String data =
          await rootBundle.loadString('assets/data/TYPES_INGREDIENTS.json');
      print("JSON Loaded Successfully");
      return data;
    } catch (e) {
      print("Error loading JSON: $e");
      return "[]";
    }
  }
}
