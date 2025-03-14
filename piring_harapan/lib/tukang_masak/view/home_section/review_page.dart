import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';
import 'package:piring_harapan/tukang_masak/view/components/analysis_chart_widget.dart';
import 'package:piring_harapan/tukang_masak/view/components/analysis_summary_widget.dart';
import 'package:piring_harapan/tukang_masak/view/components/review_list_widget.dart';
import 'package:piring_harapan/tukang_masak/view/components/menu_recommendation_widget.dart';

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderNavigation(text: "Review"),
                Text(
                  "Analysis This Week",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                AnalysisChartWidget(),
                SizedBox(height: 8),
                AnalysisSummaryWidget(),
                SizedBox(height: 16),
                ReviewListWidget(),
                SizedBox(height: 16),
                MenuRecommendationWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
