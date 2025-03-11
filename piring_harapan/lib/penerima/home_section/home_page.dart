import 'package:flutter/material.dart';
import 'package:piring_harapan/penerima/components/rating_card.dart';
import 'package:piring_harapan/penerima/components/shipment_timeline.dart';
import 'package:piring_harapan/penerima/components/review_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Welcome Back,\nGilang Amarah!",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16),
              RatingCard(rating: 11),
              SizedBox(height: 16),
              ShipmentTimeline(
                shipments: [
                  {
                    "time": "09:00 AM",
                    "details":
                        "The food has been fully cooked in the kitchen and is being prepared for loading onto the vehicle for delivery."
                  },
                  {
                    "time": "11:00 AM",
                    "details":
                        "The food has arrived to Jl. Mawar, estimated to be in school in another 15 minutes."
                  },
                  {"time": "11:15 AM", "details": ""},
                ],
              ),
              SizedBox(height: 16),
              ReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
