import 'package:flutter/material.dart';

class ShipmentTimeline extends StatelessWidget {
  final List<Map<String, String>> shipments;

  ShipmentTimeline({required this.shipments});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green[300]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "20 Products you just Sent Today",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 12),
          Column(
            children: shipments.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> shipment = entry.value;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Icon(Icons.circle, size: 12, color: Colors.green),
                      if (index != shipments.length - 1)
                        Container(
                          height: 28,
                          width: 2,
                          color: Colors.green,
                        ),
                    ],
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shipment["time"]!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          shipment["details"]!,
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 12),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                print("More button tapped");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.green, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                elevation: 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "MORE",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.keyboard_arrow_down,
                      color: Colors.black, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
