import 'package:flutter/material.dart';
import 'feedback_card_widget.dart';

class ReviewListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Review",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        FeedbackCardWidget(
          name: "Gilang Amarah",
          imagePath: "assets/img/gilang amarah.png",
          feedback:
              "Hari ini, makanan yang disajikan memiliki masalah serius. Ayam goreng yang diberikan masih belum matang dengan bagian dalam yang masih merah dan berdarah...",
          rating: 0.11,
        ),
      ],
    );
  }
}
