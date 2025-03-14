import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';


class SectionData {
  final String title;
  final String content;

  SectionData(this.title, this.content);
}

class PrivacyPolicyView extends StatelessWidget {
  final List<SectionData> sections = [
    SectionData(
      "Introduction",
      "Farmers are responsible for providing high-quality food ingredients. This Privacy Policy explains how their data is used.",
    ),
    SectionData(
      "Information Collected",
      " - Personal Data: Name, farm address, contact details.\n"
          " - Production Data: Types of ingredients supplied and stock quantity.\n"
          " - Transaction History: Orders and payments.",
    ),
    SectionData(
      "Data Usage",
      "The collected data will be used for:\n"
          " - Order processing and food ingredient distribution.\n"
          " - Monitoring quality and delivery accuracy.",
    ),
    SectionData(
      "Data Security",
      "We take reasonable measures to protect user information from unauthorized access, loss, or misuse. "
          "Data is used solely for program operations and will not be shared externally without user consent.",
    ),
    SectionData(
      "User Rights",
      "Users have the right to:\n"
          " - Update their data at any time.\n"
          " - Request information about how their data is used.",
    ),
  ];

  PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              HeaderNavigation(text: "Privacy Policy"),
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