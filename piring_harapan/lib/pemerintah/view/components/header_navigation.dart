import 'package:flutter/material.dart';

class HeaderNavigation extends StatelessWidget {
  final String text;

  const HeaderNavigation({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xff91C077)
                  ),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Icon(
                Icons.arrow_back,
                color: Color(0xff91C077),
                size: 20,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                overflow: TextOverflow.ellipsis
              ),
            ),
          ),
        ],
      ),
    );
  }
}
