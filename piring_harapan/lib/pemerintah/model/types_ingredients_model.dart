import 'dart:convert';

class TypesIngredientsModel {
  String foodID;
  String category;
  String foodName;
  String description;
  List<String> nutrition;
  String imageUrl;
  String source;
  String mbgMenu;

  TypesIngredientsModel.fromJson(Map<String, dynamic> json)
      : foodID = json['food_id'] as String,
        category = json['category'] as String,
        foodName = json['food_name'] as String,
        description = json['description'] as String,
        nutrition = List<String>.from(json['nutrition']),
        imageUrl = json['image_url'] as String,
        source = json.containsKey('source_of_supply') &&
                json['source_of_supply'] != null
            ? json['source_of_supply'] as String
            : "Unknown",
        mbgMenu = json.containsKey('MBG_menu') && json['MBG_menu'] != null
            ? json['MBG_menu'] as String
            : "Not Available";
}
