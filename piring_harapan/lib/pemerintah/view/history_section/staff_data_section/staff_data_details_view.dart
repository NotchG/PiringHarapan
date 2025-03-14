import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/controller/staff_data_details_controller.dart';
import 'package:piring_harapan/pemerintah/view/components/staff_card.dart';
import 'package:piring_harapan/common_components/text_search_bar.dart';

import 'package:piring_harapan/common_components/header_navigation.dart';

class StaffDataDetailsView extends StatefulWidget {
  /// GroupID
  /// 0 : Kitchen Manager
  /// 1 : Kitchen Staff
  /// 2 : Logistic Staff
  /// 3 : Nutritionist
  /// 4 : Program Manager
  /// 5 : Monitoring & Evaluation Team
  final int groupID;

  const StaffDataDetailsView({super.key, required this.groupID});

  @override
  State<StaffDataDetailsView> createState() => _StaffDataDetailsViewState();
}

class _StaffDataDetailsViewState extends State<StaffDataDetailsView> {

  Map<int, String> groupNames = {
    0: "Kitchen Manager",
    1: "Kitchen Staff",
    2: "Logistic Staff",
    3: "Nutritionist",
    4: "Program manager",
    5: "Monitoring & Evaluation Team"
  };

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderNavigation(text: "Staff Data"),
              Text(
                groupNames[widget.groupID] ?? "",
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
                    searchText = str;
                  });
                },
                hintText: "Search the ${groupNames[widget.groupID] ?? ""} Name",
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: StaffDataDetailsController.getStaffsBasedOnGroupIDAndName(groupID: widget.groupID, name: searchText),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: snapshot.data!.map((e) => StaffCard(staffDataModel: e)).toList(),
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
