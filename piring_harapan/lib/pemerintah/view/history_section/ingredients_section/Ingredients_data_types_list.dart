import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/controller/types_ingredients_controller.dart';
import 'package:piring_harapan/pemerintah/view/components/food_card.dart';
import 'package:piring_harapan/common_components/text_search_bar.dart';

import 'package:piring_harapan/common_components/header_navigation.dart';

class IngredientsDataTypesDetailsView extends StatefulWidget {
  final String category;

  const IngredientsDataTypesDetailsView({super.key, required this.category});

  @override
  State<IngredientsDataTypesDetailsView> createState() =>
      _IngredientsDataTypesDetailsViewState();
}

class _IngredientsDataTypesDetailsViewState
    extends State<IngredientsDataTypesDetailsView> {
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
              HeaderNavigation(text: "Types of Ingredients"),
              Text(
                widget.category,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 20),
              TextSearchBar(
                onChanged: (str) {
                  setState(() {
                    searchText = str;
                  });
                },
                hintText: "Search ${widget.category} ingredients",
              ),
              SizedBox(height: 20),
              FutureBuilder(
                future:
                    TypesIngredientsController.getIngredientsByCategoryAndName(
                  category: widget.category,
                  name: searchText,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: snapshot.data!
                              .map((e) => FoodCard(foodData: e))
                              .toList(),
                        ),
                      );
                    }
                  }
                  return Text("Loading...");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
