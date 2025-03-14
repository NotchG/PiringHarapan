import 'package:flutter/material.dart';

class StoreInfoCard extends StatelessWidget {
  const StoreInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.brown.shade300),
      ),
      child: Column(
        children: [
          // Store Name and Profile Picture
          Padding(
            padding: EdgeInsets.only(left: 15, top: 15, bottom: 10, right: 15),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/store_profile.jpg'), // Change this to your store logo
                  radius: 16,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Dedeng’s Store",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1),

          // Store Details
          Padding(
            padding: EdgeInsets.only(left: 15, top: 5, bottom: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Text("Product", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 4),
                    Text("4", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: const [
                    Text("Store Rating", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 4),
                    Text("81%", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: const [
                    Text("Response Chat", style: TextStyle(fontSize: 14)),
                    SizedBox(height: 4),
                    Text("91%", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}