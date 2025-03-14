import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piring_harapan/pemerintah/model/school_date_review_model.dart';
import 'package:piring_harapan/pemerintah/model/school_model.dart';

import 'package:piring_harapan/common_components/header_navigation.dart';
import 'package:piring_harapan/pemerintah/view/components/indicator.dart';

import '../../components/pie_chart_like_dislike.dart';

class ReviewDetailsView extends StatefulWidget {
  final SchoolModel school;
  final SchoolDateReviewModel review;

  const ReviewDetailsView({super.key, required this.school, required this.review});

  @override
  State<ReviewDetailsView> createState() => _ReviewDetailsViewState();
}

class _ReviewDetailsViewState extends State<ReviewDetailsView> {

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderNavigation(text: widget.school.schoolName),
              Text(
                DateFormat.yMMMd().format(widget.review.date),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    PieChartLikeDislike(likes: widget.review.likes, dislikes: widget.review.dislikes),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff91C077),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(20),
                      child: Text(
                        widget.review.analysis,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Review",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff91C077)
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(widget.review.reviewerProfile)),
                                      border: Border.all(
                                          color: Color(0xff91C077)
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  width: 100,
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.review.reviewerName,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(
                                        height:5,
                                      ),
                                      Text(
                                        widget.review.reviewerReview,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Rating",
                                  style: TextStyle(
                                      fontSize: 15,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xff91C077)
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Text(
                                    "${widget.review.reviewerRating}%",
                                    style: TextStyle(
                                        fontSize: 13
                                    ),
                                  )
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff91C077),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Saran & Rekomendasi",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff91C077),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        widget.review.saran,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                        ),
                      ),
                    ),
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

