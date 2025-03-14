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
      " - Provide food ingredients that meet quality standards.\n"
          " - Deliver ingredients on time and in good condition.\n"
          " - Provide accurate information about stock and ingredient quality.",
    ),
    SectionData(
      "Sanction and Violations",
      " - Repeated quality issues or delays may result in restricted access.\n"
          " - Providing false information may lead to disqualification from the program.",
    ),
  ];

  TermsofservicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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