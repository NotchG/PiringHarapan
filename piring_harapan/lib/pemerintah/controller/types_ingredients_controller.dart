import 'dart:convert';
import 'package:piring_harapan/pemerintah/data/types_ingredients_api.dart';
import 'package:piring_harapan/pemerintah/model/types_ingredients_model.dart';

class TypesIngredientsController {
  static Future<List<TypesIngredientsModel>> getIngredientsByCategoryAndName({
    required String category,
    String name = "",
  }) async {
    try {
      final response = await TypesIngredientsAPI.getIngredients();
      Iterable data = jsonDecode(response);
      List<TypesIngredientsModel> result = [];

      for (var e in data) {
        TypesIngredientsModel temp = TypesIngredientsModel.fromJson(e);
        if (temp.category == category) {
          if (name.isEmpty ||
              temp.foodName.toLowerCase().contains(name.toLowerCase())) {
            result.add(temp);
          }
        }
      }
      return result;
    } catch (e) {
      print("Error fetching ingredients by category: $e");
      return [];
    }
  }

  // Fungsi baru untuk mengambil berdasarkan sumber pasokan (case-insensitive)
  static Future<List<TypesIngredientsModel>> getIngredientsBySource(
      String source) async {
    try {
      final response = await TypesIngredientsAPI.getIngredients();
      Iterable data = jsonDecode(response);
      List<TypesIngredientsModel> result = [];

      print("Fetching data for source: $source"); // Debugging

      for (var e in data) {
        TypesIngredientsModel temp = TypesIngredientsModel.fromJson(e);
        if (temp.source.toLowerCase().contains(source.toLowerCase())) {
          result.add(temp);
        }
      }

      print("Total items found: ${result.length}"); // Debugging
      return result;
    } catch (e) {
      print("Error fetching ingredients by source: $e");
      return [];
    }
  }
}
