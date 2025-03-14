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
      "The government is responsible for verifying user data and monitoring the program. This Privacy Policy explains how user data is used in this process.",
    ),
    SectionData(
      "Information Collected",
      "To ensure the continuity and effectiveness of the program, the government collects the following information:\n"
          "- User Data: Name, contact details, address, transaction history.\n"
          "- Verification Data: Identification documents for validation purposes.\n"
          "- Reports and Statistics: Operational data related to the program.",
    ),
    SectionData(
      "Data Usage",
      "The collected data will be used to:\n"
          "- Verify user identity.\n"
          "- Monitor and evaluate the program.\n"
          "- Store data for administrative and reporting purposes.",
    ),
    SectionData(
      "Data Security",
      "We take reasonable measures to protect user information from unauthorized access, loss, or misuse. Data is encrypted and accessible only to authorized parties. "
          "Data will not be shared with third parties except as required by applicable law. Information may be used to improve government services.",
    ),
    SectionData(
      "User Rights",
      "Users have the right to:\n"
          "- Request corrections or updates to their data.\n"
          "- Inquire about how their data is used.",
    ),
  ];

  PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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