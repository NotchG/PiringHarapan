import 'package:flutter/material.dart';
import 'delivery_detail_page.dart';

class NotificationListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notification",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Divider(
                      color: Colors.black26, thickness: 1), // Garis horizontal
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                children: [
                  _buildNotificationCard(
                    context,
                    title: "Order Processed",
                    description:
                        "\"Your nasi kuning order is being prepared by Ani Wijaya.\"",
                    date: "07 March 2025",
                    details: {
                      "Type of Food": "Nasi Kuning",
                      "Total Serving": "120 portion",
                      "Delivery Date": "07 March 2025",
                      "Status": "On Process"
                    },
                  ),
                  _buildNotificationCard(
                    context,
                    title: "Delivery Has Been Sent",
                    description:
                        "\"Your ayam panggang order has been delivered by Fatmawati Indah. Estimated arrival at 11.30 AM.\"",
                    date: "21 January 2025",
                    details: {
                      "Type of Food": "Ayam Panggang",
                      "Total Serving": "25 portion",
                      "Delivery Date": "21 January 2025",
                      "Status": "On The Way"
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(BuildContext context,
      {required String title,
      required String description,
      required String date,
      required Map<String, String> details}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DeliveryDetailPage(title: title, details: details),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black26, width: 1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(description, style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
            Text(date, style: TextStyle(fontSize: 12, color: Colors.black54)),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: details.entries.map((entry) {
                return Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entry.key,
                          style:
                              TextStyle(fontSize: 12, color: Colors.black87)),
                      Text(entry.value,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
