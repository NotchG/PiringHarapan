import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piring_harapan/pemerintah/controller/review_controller.dart';
import 'package:piring_harapan/pemerintah/model/school_model.dart';
import 'package:piring_harapan/pemerintah/view/components/date_picker_bar.dart';
import 'package:piring_harapan/pemerintah/view/history_section/review_section/review_details_view.dart';

import 'package:piring_harapan/pemerintah/view/components/common_list_button.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';

class ReviewDatesView extends StatefulWidget {
  final SchoolModel schoolModel;
  const ReviewDatesView({super.key, required this.schoolModel});

  @override
  State<ReviewDatesView> createState() => _ReviewDatesViewState();
}

class _ReviewDatesViewState extends State<ReviewDatesView> {
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderNavigation(text: "Review"),
              Text(
                widget.schoolModel.schoolName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DatePickerBar(
                  hintText: "Pick a date",
                  onChanged: (d) {
                    setState(() {
                      date = d;
                    });

                  }
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: ReviewController.getDatesBySchoolIDAndDate(
                      schoolID: widget.schoolModel.schoolID,
                      date: date
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: snapshot.data!.map((e) =>
                                CommonListButton(
                                    text: DateFormat.yMMMd().format(e.date),
                                    onClick: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              ReviewDetailsView(school: widget.schoolModel, review: e,)));
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
