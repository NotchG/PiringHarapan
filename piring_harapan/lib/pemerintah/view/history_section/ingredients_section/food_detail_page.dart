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
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              foodData.imageUrl,
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff91C077)),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xff91C077),
                          size: 20,
                        ),
                      ),
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
                    ExpansionTile(
                      title: Text("Description"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(foodData.description),
                        ),
                      ],
                    ),
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
                    ExpansionTile(
                      title: Text("Source of Supply"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(foodData.source),
                        ),
                      ],
                    ),
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
