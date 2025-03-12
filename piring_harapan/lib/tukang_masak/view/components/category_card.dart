import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final ImageProvider image;
  final Function() onClick;
  const CategoryCard({super.key, required this.image, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xff91C077),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}
