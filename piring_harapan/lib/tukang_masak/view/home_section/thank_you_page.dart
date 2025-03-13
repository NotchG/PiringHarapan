import 'package:flutter/material.dart';
import 'package:piring_harapan/tukang_masak/view/components/UnderstoodButton.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Thank you for\nChoosing This \nMenu!",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "This will later affect the AI Menu Recommendation, based on your choice we’ll be able to recommend a menu suited to your choice before.",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    "assets/img/robot.png",
                    width: 240,
                    height: 240,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 16),
              UnderstoodButton(),
            ],
          ),
        ),
      ),
    );
  }
}
