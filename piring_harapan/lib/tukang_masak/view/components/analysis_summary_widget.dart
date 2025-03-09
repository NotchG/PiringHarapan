import 'package:flutter/material.dart';

class AnalysisSummaryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF91C077),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "Analisis menunjukkan bahwa hanya 20.54% penerima program MBG yang menyukai makanan, sedangkan mayoritas tidak menyukainya. Alasan utama ketidaksukaan adalah rasa makanan yang kurang enak dan banyaknya makanan yang belum matang dengan baik.",
        style: TextStyle(color: Colors.black, fontSize: 14),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
