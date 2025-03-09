import 'package:flutter/material.dart';
import 'package:piring_harapan/petani/components/header_widget.dart';
import 'package:piring_harapan/petani/components/new_order_card.dart';
import 'package:piring_harapan/petani/components/shipment_timeline.dart';
import 'package:piring_harapan/petani/components/store_rating.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Menyesuaikan dengan background gambar
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16), // Padding atas-bawah
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(name: "Dedeng Herman"),
              SizedBox(height: 8), // Jarak antar komponen
              NewOrderCard(
                imagePath: "assets/img/angga_hamzah.png",
                orderDetails: "50 Orders from Angga Hamzah\nRp800.000",
                paymentMethod: "assets/img/bca.png",
              ),
              SizedBox(height: 12),
              ShipmentTimeline(
                shipments: [
                  {
                    "time": "09:00 AM",
                    "details":
                        "The product has arrived at the Asianti Warehouse, Jakarta and ready to be delivered to the next warehouse."
                  },
                  {
                    "time": "11:00 AM",
                    "details":
                        "The product has arrived at Mirawanda Warehouse, Jakarta and ready to be delivered to the next warehouse."
                  },
                  {"time": "11:15 AM", "details": "Next shipment in progress."},
                ],
              ),
              SizedBox(height: 12),
              StoreRating(rating: 0.81),
              SizedBox(height: 16), // Jarak ke bawah agar tidak terlalu dekat
            ],
          ),
        ),
      ),
    );
  }
}
