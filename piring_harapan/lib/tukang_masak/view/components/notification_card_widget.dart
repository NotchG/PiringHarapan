import 'package:flutter/material.dart';

class NotificationCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final Map<String, String>? details;
  final VoidCallback? onTap;

  const NotificationCardWidget({
    Key? key,
    required this.title,
    required this.description,
    this.details,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                if (details != null)
                  ...details!.entries.map(
                    (entry) => Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        "${entry.key}: ${entry.value}",
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey[300], thickness: 1),
      ],
    );
  }
}
