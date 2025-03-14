import 'package:flutter/material.dart';
import 'package:piring_harapan/tukang_masak/model/product_review_model.dart';

class ReviewCard extends StatelessWidget {
  final ProductReviewModel review;
  const ReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("http://dummyimage.com/100x100.png/dddddd/000000"), // Change to reviewer's image
                radius: 30,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(review.reviewerName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      const Icon(Icons.thumb_up, color: Colors.green, size: 20),
                      const SizedBox(width: 6),
                      Text(
                        "${review.rating}%",
                        style: TextStyle(fontSize: 16,),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            review.description,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}