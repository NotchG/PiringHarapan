import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';

class DeliveryDetailPage extends StatelessWidget {
  final String title;
  final Map<String, String> details;

  const DeliveryDetailPage(
      {Key? key, required this.title, required this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderNavigation(text: title),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xffE9F5DB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Order Detail",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff91C077)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: details.entries
                      .map((entry) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(entry.key,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54)),
                                Text(entry.value,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xffE9F5DB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Track Your Order",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff91C077)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order Number: NK100007032025",
                        style: TextStyle(fontSize: 14)),
                    SizedBox(height: 4),
                    Text("Estimated Delivery: 2025-03-07, 11.30 AM",
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(height: 16),
              _buildTrackingProgress([
                {"time": "07 Mar | 10.50 AM", "status": "Order in transit."},
                {
                  "time": "07 Mar | 10:45 AM",
                  "status": "Picked up by courier."
                },
                {
                  "time": "07 Mar | 09:00 PM",
                  "status": "Preparing your order."
                },
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrackingProgress(List<Map<String, String>> progressList) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff91C077)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tracking Progress",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          for (int i = 0; i < progressList.length; i++) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Color(0xff91C077),
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xff91C077), width: 2),
                      ),
                    ),
                    if (i != progressList.length - 1)
                      Container(
                        width: 2,
                        height: 24,
                        color: Color(0xff91C077),
                      ),
                  ],
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(progressList[i]["time"]!,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      SizedBox(height: 2),
                      Text(progressList[i]["status"]!,
                          style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}
