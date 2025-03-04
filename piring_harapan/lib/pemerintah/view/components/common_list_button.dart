import 'package:flutter/material.dart';

class CommonListButton extends StatelessWidget {
  final String text;
  final Function() onClick;

  const CommonListButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onClick,
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(
                color: Color(0xff91C077)
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Text(text),
        ),
      ),
    );
  }
}

