import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';
import 'package:piring_harapan/tukang_masak/model/recipe_model.dart';
import 'package:piring_harapan/tukang_masak/view/components/recipe_price_list.dart';
import 'package:piring_harapan/tukang_masak/view/components/check_store_button.dart';
import 'package:piring_harapan/tukang_masak/view/components/step_by_step_guide.dart';
import 'package:piring_harapan/tukang_masak/view/components/make_button.dart';

class AiMenuRecommendationPage extends StatelessWidget {
  final String menuName;
  final List<Ingredient> ingredients;
  final List<Map<String, dynamic>> steps;

  const AiMenuRecommendationPage({
    Key? key,
    required this.menuName,
    required this.ingredients,
    required this.steps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              HeaderNavigation(text: "AI Menu Recommendation"),
              Text(
                menuName,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecipePriceList(ingredients: ingredients),
                  SizedBox(height: 8),
                  CheckStoreButton(),
                ],
              ),
              SizedBox(height: 24),
              Text(
                "Step-by-Step How to Make",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SizedBox(height: 300, child: StepByStepGuide(steps: steps)),
              SizedBox(height: 16),
              MakeButton(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
