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
      "Meal recipients participate in this program by receiving meals and providing feedback. This Privacy Policy explains how their data is used.",
    ),
    SectionData(
      "Information Collected",
      " - Personal Data: Name, contact details, delivery address.\n"
          " - Receiving History: Quantity and type of meals received.\n"
          " - Feedback: Ratings and reviews of received meals.",
    ),
    SectionData(
      "Data Usage",
      "The collected data will be used to:\n"
          " - Ensure fair and targeted food distribution.\n"
          " - Improve meal quality through recipient feedback.",
    ),
    SectionData(
      "Data Security",
      "We take reasonable measures to protect user information from unauthorized access, loss, or misuse. "
          "User data will not be shared without consent and will only be used for program evaluation and distribution.",
    ),
    SectionData(
      "User Rights",
      "Users have the right to:\n"
          " - Modify or delete their data from the system.\n"
          " - Choose to provide feedback anonymously.",
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