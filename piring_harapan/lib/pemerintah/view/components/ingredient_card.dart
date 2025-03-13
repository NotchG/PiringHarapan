import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String title;
  final VoidCallback onClick;

  const IngredientCard({
    super.key,
    required this.title,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: InkWell(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff91C077), width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFA88466),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
