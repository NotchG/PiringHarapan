import 'package:flutter/material.dart';
import 'package:piring_harapan/tukang_masak/view/home_section/thank_you_page.dart';

class MakeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.green),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThankYouPage()),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "MAKE",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
