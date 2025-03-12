import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String name;

  HeaderWidget({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        "Welcome Back,\n$name!",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
