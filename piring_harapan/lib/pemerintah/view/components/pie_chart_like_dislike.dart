import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'indicator.dart';

class PieChartLikeDislike extends StatefulWidget {
  final int likes;
  final int dislikes;
  const PieChartLikeDislike({super.key, required this.likes, required this.dislikes});

  @override
  State<PieChartLikeDislike> createState() => _PieChartLikeDislikeState();
}

class _PieChartLikeDislikeState extends State<PieChartLikeDislike> {

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 0,
              sections: [
                PieChartSectionData(
                  value: widget.likes.toDouble(),
                  radius: 80,
                  color: Color(0xffFF928A),
                  borderSide: touchedIndex == 0
                      ? const BorderSide(
                      color: Color(0xffd15e56), width: 6)
                      : BorderSide(
                      color: Color(0xffFF928A).withValues(alpha: 0)),
                ),
                PieChartSectionData(
                  value: widget.dislikes.toDouble(),
                  radius: 80,
                  color: Color(0xff8979FF),
                  borderSide: touchedIndex == 1
                      ? const BorderSide(
                      color: Color(0xff4839b3), width: 6)
                      : BorderSide(
                      color: Color(0xff8979FF).withValues(alpha: 0)),
                )
              ],
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex = pieTouchResponse
                        .touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              startDegreeOffset: 180,
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 1,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Indicator(
              color: Color(0xffFF928A),
              text: 'Like',
              isSquare: false,
              size: touchedIndex == 0 ? 18 : 16,
              textColor: touchedIndex == 0
                  ? Colors.black
                  : Colors.black38,
            ),
            Indicator(
              color: Color(0xff8979FF),
              text: 'Dislike',
              isSquare: false,
              size: touchedIndex == 1 ? 18 : 16,
              textColor: touchedIndex == 1
                  ? Colors.black
                  : Colors.black38,
            ),
          ],
        ),
      ],
    );
  }
}
