import 'package:flutter/material.dart';

class AskBotButtonWidget extends StatelessWidget {
  final VoidCallback onTap; // Tidak boleh null, jadi harus diberikan

  const AskBotButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green), // Border hijau
          borderRadius: BorderRadius.circular(12), // Sudut membulat
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.auto_awesome, color: Colors.green, size: 20), // Ikon bot
            SizedBox(width: 8),
            Text(
              "Ask Our Bot More About It!",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
