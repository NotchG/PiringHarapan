import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';


class SectionData {
  final String title;
  final String content;

  SectionData(this.title, this.content);
}

class PrivacyPolicyView extends StatelessWidget {
  final List<SectionData> sections = [
    SectionData("Introduction", "The Cook is responsible for preparing food according to program standards. This Privacy Policy explains how their data is used."),
    SectionData("Information Collected", "- Personal Data: Name, kitchen address, contact details.\n- Cooking History: Number of orders processed.\n- Reviews and Feedback: Input from meal recipients."),
    SectionData("Data Usage", "The collected data will be used to:\n- Manage orders and ensure food standards are met.\n- Evaluate services and improve quality."),
    SectionData("Data Security", "We take reasonable measures to protect user information from unauthorized access, loss, or misuse. Data is used solely for program purposes and will not be shared without consent."),
    SectionData("User Rights", "Users have the right to:\n- Update their information at any time.\n- Obtain information on how their data is used."),
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