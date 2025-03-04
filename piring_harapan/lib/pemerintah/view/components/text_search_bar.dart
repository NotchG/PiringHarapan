import 'package:flutter/material.dart';

class TextSearchBar extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;

  const TextSearchBar({super.key, required this.onChanged, this.hintText = ""});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff91C077)),
          borderRadius: BorderRadius.circular(10),
          gapPadding: 2
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal
        )
      ),
    );
  }
}
