import 'package:flutter/material.dart';

class ReviewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Review")),
      body: Center(
        child: Text(
          "Review Section",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
