import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/view/components/header_navigation.dart';
import 'package:piring_harapan/pemerintah/view/components/ingredient_card.dart';
import 'package:piring_harapan/pemerintah/view/Ingredients_data_types_detail.dart';
import 'package:piring_harapan/pemerintah/view/IngredientsSource.dart';

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
              SizedBox(height: 20), // Jarak antara header dan card pertama
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
              SizedBox(height: 15), // Jarak antar card
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
