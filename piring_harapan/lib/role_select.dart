import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF7E7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/Logo.png', height: 100),
            const SizedBox(height: 16),
            const Text(
              "Piring Harapan",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("Silahkan pilih peran Anda"),
            const SizedBox(height: 24),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                RoleCard("Penerima", "Saya menerima makanan bergizi",
                    Icons.volunteer_activism, Colors.green, context),
                RoleCard("Pemerintah", "Saya mengelola program MBG",
                    Icons.account_balance, Colors.brown, context),
                RoleCard("Pemasak", "Saya menyiapkan makanan bergizi",
                    Icons.restaurant, Colors.orange, context),
                RoleCard("Petani", "Saya menyediakan bahan makanan segar",
                    Icons.grass, Colors.yellow, context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget RoleCard(String title, String subtitle, IconData icon, Color color,
      BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case "Penerima":
            Navigator.pushNamed(context, '/penerima');
            break;
          case "Pemerintah":
            Navigator.pushNamed(context, '/pemerintah');
            break;
          case "Pemasak":
            Navigator.pushNamed(context, '/tukang_masak');
            break;
          case "Petani":
            Navigator.pushNamed(context, '/petani');
            break;
        }
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(title,
                style: TextStyle(fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 4),
            Text(subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
