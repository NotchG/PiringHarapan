import 'package:flutter/material.dart';

class ReviewNotificationWidget extends StatelessWidget {
  final String sellerName;
  final VoidCallback onAddReview;

  const ReviewNotificationWidget({
    Key? key,
    required this.sellerName,
    required this.onAddReview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "The product from $sellerName has arrived! How about you adding a review?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: onAddReview,
            icon: Icon(Icons.add, color: Colors.white, size: 18),
            label: Text("ADD"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFA67C52),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
