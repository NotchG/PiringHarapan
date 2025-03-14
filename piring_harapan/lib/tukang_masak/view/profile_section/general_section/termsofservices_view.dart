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
      """
    - Prepare nutritious meals that meet hygiene standards.
    - Ensure food is safely packaged.
    - Be willing to receive feedback from meal recipients.
    """,
    ),
    SectionData(
      "Sanctions and Violations",
      """
    - Repeated complaints about food may result in restricted access.
    - Misuse of ingredients or information may lead to the cook’s removal from the program.
    """,
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