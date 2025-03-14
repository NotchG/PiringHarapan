import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';


class SectionData {
  final String title;
  final String content;

  SectionData(this.title, this.content);
}

class TermsofservicesView extends StatelessWidget {
  final List<SectionData> sections = [
    SectionData(
      "Rights and Responsibilities",
      " - Bertanggung jawab atas verifikasi data pengguna.\n"
          " - Mengakses dan menganalisis laporan serta statistik program.\n"
          " - Tidak menyalahgunakan akses data pengguna.",
    ),
    SectionData(
      "Sanction and Violations",
      " - Jika Pemerintah gagal melakukan verifikasi yang akurat, akses dapat dibatasi.\n"
          " - Penyalahgunaan data pengguna dapat berujung pada tindakan hukum.",
    ),
    SectionData(
      "Policy Changes",
      "The government may update this policy as needed to comply with regulations.",
    ),
  ];

  TermsofservicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            HeaderNavigation(text: "Terms of Services"),
            Expanded(
              child: ListView(
                children: sections.map((section) => _buildSection(section)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(SectionData section) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(section.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(section.content, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}