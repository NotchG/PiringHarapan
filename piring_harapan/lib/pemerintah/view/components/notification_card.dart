import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  final int index;
  final DateTime time;
  final String description;
  const NotificationCard({super.key, required this.index, required this.time, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color(0xff91C077)
                ),
                borderRadius: BorderRadius.circular(10000)
            ),
            child: Center(
              child: Text(
                  index.toString(),
                style: TextStyle(
                  color: Color(0xff91C077),
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xff91C077)
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.fire_truck,
                    color: Color(0xff6C584C),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat.jm().format(time),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12
                          ),
                        ),
                        Text(
                          description,
                          style: TextStyle(
                              fontSize: 12
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
