import 'package:flutter/material.dart';

class MenuRecommendationWidget extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      "image": "assets/img/kangkung.png",
      "name": "Kangkung Tumis",
      "recommendation": "100 Children Recommends This Dish"
    },
    {
      "image": "assets/img/ayam_panggang.png",
      "name": "Ayam Panggang",
      "recommendation": "30 Children Recommends This Dish"
    },
    {
      "image": "assets/img/buncis.png",
      "name": "Buncis Bawang",
      "recommendation": "10 Children Recommends This Dish"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Menu Recommendation",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Column(
          children: menuItems.map((menu) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      menu["image"]!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menu["name"]!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          menu["recommendation"]!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
