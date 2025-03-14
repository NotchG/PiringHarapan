import 'package:piring_harapan/common_components/header_navigation.dart';
import 'package:piring_harapan/pemerintah/view/components/ingredient_card.dart';
import 'package:piring_harapan/pemerintah/view/history_section/ingredients_section/Ingredients_data_types_detail.dart';
import 'package:piring_harapan/pemerintah/view/history_section/ingredients_section/IngredientsSource.dart';
import 'package:flutter/material.dart';

class IngredientsDataView extends StatelessWidget {
  const IngredientsDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderNavigation(text: "Logbook"),
              SizedBox(height: 20),
              IngredientCard(
                title: "Types of Ingredients",
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IngredientsDataTypesDetail()),
                  );
                },
              ),
              SizedBox(height: 15),
              IngredientCard(
                title: "Source of Ingredients",
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IngredientsSource()),
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
