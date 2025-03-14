import 'package:flutter/material.dart';
import 'package:piring_harapan/penerima/home_section/home_page.dart';
import 'package:piring_harapan/penerima/profile_section/profile_section_view.dart';
import 'package:piring_harapan/penerima/review_section/review_page.dart';
import 'package:piring_harapan/penerima/notification_section/notification_page.dart';

class MainPenerimaView extends StatefulWidget {
  @override
  _MainPenerimaViewState createState() => _MainPenerimaViewState();
}

class _MainPenerimaViewState extends State<MainPenerimaView> {
  int _selectedIndex = 0;

  final List<Widget> _sections = [
    HomePage(),
    ReviewSection(),
    NotificationSection(),
    ProfileSectionView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _sections[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFCDE5B6),
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Review',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
