import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/model/types_ingredients_model.dart';

class FoodDetailPage extends StatelessWidget {
  final TypesIngredientsModel foodData;

  FoodDetailPage({super.key, required this.foodData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar utama
              Stack(
                children: [
                  Image.network(
                    foodData.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodData.foodName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      foodData.category,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 20),

                    // Deskripsi
                    ExpansionTile(
                      title: Text("Description"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(foodData.description),
                        ),
                      ],
                    ),

                    // Nutritional Content
                    ExpansionTile(
                      title: Text("Nutritional Content"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Wrap(
                            spacing: 8,
                            children: foodData.nutrition.map((nutrient) {
                              return Chip(
                                label: Text(nutrient),
                                backgroundColor: Color(0xff91C077),
                                labelStyle: TextStyle(color: Colors.white),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),

                    // Source of Supply
                    ExpansionTile(
                      title: Text("Source of Supply"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(foodData.source),
                        ),
                      ],
                    ),

                    // MBG Menu
                    ExpansionTile(
                      title: Text("MBG Menu"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(foodData.mbgMenu),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
