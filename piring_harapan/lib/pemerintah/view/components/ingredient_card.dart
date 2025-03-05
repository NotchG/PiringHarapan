import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String title;
  final VoidCallback onClick;

  const IngredientCard({
    super.key,
    required this.title,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160, // Mengatur tinggi card agar sesuai desain
      width: double.infinity, // Memenuhi lebar penuh
      child: InkWell(
        onTap: onClick, // Navigasi saat card ditekan
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Color(0xff91C077), width: 1.5), // Warna border hijau
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(
              20), // Padding lebih kecil agar teks tidak terlalu ke tengah
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize:
                    18, // Sedikit lebih besar untuk proporsi yang lebih baik
                fontWeight: FontWeight.bold,
                color: Color(0xFFA88466),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
