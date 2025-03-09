import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final VoidCallback?
      onPressed; // Mengizinkan null agar tombol bisa dinonaktifkan

  const GreenButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Sekarang bisa menerima null
      style: ElevatedButton.styleFrom(
        backgroundColor: onPressed != null
            ? Colors.green
            : Colors.grey, // Warna berubah jika disabled
        foregroundColor: Colors.white, // Warna teks putih
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(8), // Membuat sudut sedikit membulat
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 24, vertical: 12), // Ukuran padding tombol
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
