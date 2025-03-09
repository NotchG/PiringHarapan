import 'package:flutter/material.dart';

class NewOrderCard extends StatelessWidget {
  final String imagePath;
  final String orderDetails;
  final String paymentMethod;

  NewOrderCard({
    required this.imagePath,
    required this.orderDetails,
    required this.paymentMethod,
  });

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Order Just Dropped",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 33,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderDetails,
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    SizedBox(height: 9),
                    Row(
                      children: [
                        Text("Paid with ", style: TextStyle(fontSize: 15)),
                        Image.asset(paymentMethod, width: 40),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
