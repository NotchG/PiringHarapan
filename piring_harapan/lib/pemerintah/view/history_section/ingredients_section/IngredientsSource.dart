import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/controller/types_ingredients_controller.dart';
import 'package:piring_harapan/pemerintah/view/components/food_card.dart';
import 'package:piring_harapan/common_components/text_search_bar.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';

class IngredientsSource extends StatefulWidget {
  const IngredientsSource({super.key});

  @override
  State<IngredientsSource> createState() => _IngredientsSourceState();
}

class _IngredientsSourceState extends State<IngredientsSource> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderNavigation(text: "Source of Ingredients"),
              TextSearchBar(
                onChanged: (str) {
                  setState(() {
                    searchText = str;
                  });
                },
                hintText: "Search source of ingredients",
              ),
              SizedBox(height: 20),
              FutureBuilder(
                future: TypesIngredientsController.getIngredientsBySource(
                    searchText),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Failed to load data"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No ingredients found"));
                  }
                  return Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: snapshot.data!
                          .map((ingredient) => FoodCard(foodData: ingredient))
                          .toList(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
