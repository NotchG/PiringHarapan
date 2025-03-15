import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dedeng’s Store")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/farmer.jpg"),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dedeng’s Store",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Chip(
                        label: Text("50 Subscribers",
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.green),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatBox("Store Rating", "81%"),
                _buildStatBox("Response Chat", "91%"),
              ],
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Balance", style: TextStyle(color: Colors.grey)),
                  Text("Rp.589.150",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: Text("Total Income",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOrderStatus("101", "Perlu Dikirim"),
                _buildOrderStatus("1", "Pengembalian"),
                _buildOrderStatus("4", "Pembatalan"),
              ],
            ),
            SizedBox(height: 16),
            _buildMenuOption(Icons.chat, "Chats"),
            _buildMenuOption(Icons.shopping_bag, "Products"),
            _buildMenuOption(Icons.trending_up, "Performance"),
            _buildMenuOption(Icons.analytics, "AI Analytics"),
            _buildMenuOption(Icons.reviews, 'Reviews')
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(String title, String value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
        ),
        child: Column(
          children: [
            Text(title, style: TextStyle(color: Colors.grey)),
            Text(value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStatus(String count, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(count,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(label, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildMenuOption(IconData icon, String title) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
