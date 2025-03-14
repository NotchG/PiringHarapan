import 'package:flutter/material.dart';



class CategoryCard extends StatelessWidget {
  final ImageProvider image;
  final Function() onClick;
  final bool isActive;
  const CategoryCard({super.key, required this.image, required this.onClick, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 120,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xff91C077),
          border: isActive ? Border.all(color: Colors.green.shade300, width: 5) : Border.all(),
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
