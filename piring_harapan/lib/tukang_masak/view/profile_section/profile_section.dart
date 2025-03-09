import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Text(
          "Profile Section",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
