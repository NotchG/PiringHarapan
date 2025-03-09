import 'package:flutter/material.dart';

class MarketSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Text(
          "Market Section",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
