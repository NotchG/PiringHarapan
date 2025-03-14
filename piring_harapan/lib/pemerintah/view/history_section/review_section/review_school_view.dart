import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/controller/review_controller.dart';
import 'package:piring_harapan/pemerintah/view/components/common_list_button.dart';
import 'package:piring_harapan/pemerintah/view/history_section/review_section/review_dates_view.dart';

import 'package:piring_harapan/common_components/header_navigation.dart';
import 'package:piring_harapan/common_components/text_search_bar.dart';

class ReviewSchoolView extends StatefulWidget {
  const ReviewSchoolView({super.key});

  @override
  State<ReviewSchoolView> createState() => _ReviewSchoolViewState();
}

class _ReviewSchoolViewState extends State<ReviewSchoolView> {
  
  String schoolName = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderNavigation(text: "Logbook"),
              Text(
                "Review",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextSearchBar(
                onChanged: (str) {
                  setState(() {
                    schoolName = str;
                  });
                },
                hintText: "Search the school name",
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: ReviewController.getSchoolsByName(name: schoolName),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: snapshot.data!.map((e) => CommonListButton(text: e.schoolName, onClick: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewDatesView(schoolModel: e,)));
                            })).toList(),
                          ),
                        );
                      }
                    }
                    return Text("Loading...");
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
