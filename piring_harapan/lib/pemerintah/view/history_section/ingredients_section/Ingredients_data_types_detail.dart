import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';
import 'package:piring_harapan/pemerintah/view/components/common_list_button.dart';
import 'package:piring_harapan/pemerintah/view/history_section/ingredients_section/Ingredients_data_types_list.dart';

class IngredientsDataTypesDetail extends StatelessWidget {
  const IngredientsDataTypesDetail({super.key});

  void _navigate(BuildContext context, String categoryID) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => IngredientsDataTypesDetailsView(
                category: categoryID,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderNavigation(text: "Ingredients"),
              SizedBox(height: 10),
              Text(
                "Types of Ingredients",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 20),
              CommonListButton(
                text: "Staple Food",
                onClick: () {
                  _navigate(context, "Staple Food");
                },
              ),
              SizedBox(height: 5),
              CommonListButton(
                text: "Animal Protein",
                onClick: () {
                  _navigate(context, "Animal Protein");
                },
              ),
              SizedBox(height: 5),
              CommonListButton(
                text: "Plant-Based Protein",
                onClick: () {
                  _navigate(context, "Plant-Based Protein");
                },
              ),
              SizedBox(height: 5),
              CommonListButton(
                text: "Vegetables & Fruit",
                onClick: () {
                  _navigate(context, "Vegetables & Fruit");
                },
              ),
              SizedBox(height: 5),
              CommonListButton(
                text: "Spices & Seasonings",
                onClick: () {
                  _navigate(context, "Spices & Seasonings");
                },
              ),
              SizedBox(height: 5),
              CommonListButton(
                text: "Oils & Fats",
                onClick: () {
                  _navigate(context, "Oils & Fats");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
