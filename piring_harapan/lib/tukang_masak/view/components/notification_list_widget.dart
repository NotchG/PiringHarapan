import 'package:flutter/material.dart';
import 'package:piring_harapan/tukang_masak/view/components/notification_card_widget.dart';
import 'package:piring_harapan/tukang_masak/view/components/delivery_detail_page.dart';

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
                  Divider(color: Colors.black26, thickness: 1),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  NotificationCardWidget(
                    title: "New Priority Order",
                    description:
                        "You have received a priority order from Ani Wijaya. Please process it as soon as possible.",
                    details: {
                      "Food Type": "Nasi Kuning",
                      "Delivery Date": "19 March 2025",
                      "Status": "Pending Confirmation"
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeliveryDetailPage()),
                      );
                    },
                  ),
                  NotificationCardWidget(
                    title: "Holiday/Temporary Closure Reminder",
                    description:
                        "Your store is scheduled to close on 15 March. Make sure all orders are completed before then.",
                    details: {
                      "Closure Date": "15 March 2025",
                      "Reason": "Kitchen Maintenance"
                    },
                  ),
                  NotificationCardWidget(
                    title: "Delivery Received",
                    description:
                        "The order for beras has been received by Diana Asmirati. Thank you for your cooperation!",
                    details: {
                      "Ingredient Type": "Beras",
                      "Supplier": "Diana Asmirati",
                      "Delivery Date": "8 December 2025"
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeliveryDetailPage()),
                      );
                    },
                  ),
                  NotificationCardWidget(
                    title: "Feedback Received",
                    description:
                        "You have received feedback from SDN Harapan Bangsa about the quality of ayam bakar.",
                    details: {
                      "Food Type": "Ayam Bakar",
                      "Quality": "\"Very delicious, not burnt\""
                    },
                  ),
                  NotificationCardWidget(
                    title: "Order Canceled",
                    description:
                        "The order for beras from Ani Wijaya has been canceled. Reason: Wrong address.",
                    details: {
                      "Ingredient Type": "Beras",
                      "Cancellation Date": "10 May 2025"
                    },
                  ),
                  NotificationCardWidget(
                    title: "Payment Received",
                    description:
                        "Payment for the order of beras has been received. Thank you!",
                    details: {
                      "Ingredient Type": "Beras",
                      "Payment Date": "8 December 2025"
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
}
