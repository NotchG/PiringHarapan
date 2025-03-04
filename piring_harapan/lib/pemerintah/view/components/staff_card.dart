import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/model/staff_data_model.dart';

class StaffCard extends StatelessWidget {
  final StaffDataModel staffDataModel;
  StaffCard({super.key, required this.staffDataModel});

  final Map<int, String> groupNames = {
    0: "Kitchen Manager",
    1: "Kitchen Staff",
    2: "Logistic Staff",
    3: "Nutritionist",
    4: "Program manager",
    5: "Monitoring & Evaluation Team"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
                color: Color(0xff91C077)
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(staffDataModel.staffProfilePicture)),
                    border: Border.all(
                      color: Color(0xff91C077)
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        staffDataModel.staffName,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                        groupNames[staffDataModel.groupID] ?? "",
                      style: TextStyle(
                          fontSize: 13,
                      ),
                    ),
                    Text(
                        staffDataModel.staffLocation,
                      style: TextStyle(
                          fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(0xff91C077)
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.download,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Data Lengkap",
                        style: TextStyle(
                            fontSize: 8
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
