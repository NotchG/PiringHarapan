class Ingredient {
  final String name;
  final String quantity;
  final int price;

  Ingredient({required this.name, required this.quantity, required this.price});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      quantity: json['quantity'],
      price: int.parse(json['price'])
    );
  }
}

class Steps {
  final List<String> preparation;
  final List<String> cooking;
  final List<String> serving;

  Steps({required this.preparation, required this.cooking, required this.serving});

  factory Steps.fromJson(Map<String, dynamic> json) {
    return Steps(
      preparation: List<String>.from(json['preparation'] ?? []),
      cooking: List<String>.from(json['cooking'] ?? []),
      serving: List<String>.from(json['serving'] ?? []),
    );
  }
}

class Recipe {
  final String name;
  final List<Ingredient> ingredients;
  final Steps steps;

  Recipe({required this.name, required this.ingredients, required this.steps});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      ingredients: (json['ingredients'] as List)
          .map((item) => Ingredient.fromJson(item))
          .toList(),
      steps: Steps.fromJson(json['steps']),
    );
  }
}