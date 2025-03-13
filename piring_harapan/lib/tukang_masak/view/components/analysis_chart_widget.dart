import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalysisChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  color: Colors.redAccent,
                  value: 79.46,
                  title: '',
                  radius: 50,
                ),
                PieChartSectionData(
                  color: Colors.blueAccent,
                  value: 20.54,
                  title: '',
                  radius: 50,
                ),
              ],
              sectionsSpace: 2,
              centerSpaceRadius: 40,
              borderData: FlBorderData(show: false),
            ),
          ),
        ),

        SizedBox(height: 8),

        // Legend
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegendItem(Colors.redAccent, "Like"),
            SizedBox(width: 16),
            _buildLegendItem(Colors.blueAccent, "Dislike"),
          ],
        ),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
