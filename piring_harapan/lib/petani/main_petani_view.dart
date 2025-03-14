import 'package:flutter/material.dart';
import 'package:piring_harapan/petani/profile_section/profile_section_view.dart';
import 'package:piring_harapan/petani/home_section/home_page.dart';
import 'package:piring_harapan/petani/store_section/store_page.dart';
import 'package:piring_harapan/tukang_masak/view/notification_section/notification_section.dart';

class MainPetaniView extends StatefulWidget {
  @override
  _MainPetaniViewState createState() => _MainPetaniViewState();
}

class _MainPetaniViewState extends State<MainPetaniView> {
  int _selectedIndex = 0;

  final List<Widget> _sections = [
    HomePage(),
    StorePage(),
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
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
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
