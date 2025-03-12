import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/view/components/notification_card.dart';
import 'package:piring_harapan/pemerintah/view/components/pie_chart_like_dislike.dart';
import 'package:piring_harapan/pemerintah/view/main_pemerintah_view.dart';

import '../components/indicator.dart';

class PemerintahHomeView extends StatefulWidget {
  const PemerintahHomeView({super.key});

  @override
  State<PemerintahHomeView> createState() => _PemerintahHomeViewState();
}

class _PemerintahHomeViewState extends State<PemerintahHomeView> {

  int likes = 200;
  int dislikes = 300;
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Welcome Back, Kelompok 2 UREEKA",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xff91C077)
                        ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Text(
                        "Notification",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  NotificationCard(
                      index: 1,
                      time: DateTime.now(),
                      description: "Lorem Ipsum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam"
                  ),
                  NotificationCard(
                      index: 2,
                      time: DateTime.now(),
                      description: "Lorem Ipsum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam"
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      NavigationBar nBar = PEMERINTAH_KEY.currentWidget as NavigationBar;
                      nBar.onDestinationSelected!(3);
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xff91C077)
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Review Analysis This Week",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PieChartLikeDislike(likes: likes, dislikes: dislikes)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
