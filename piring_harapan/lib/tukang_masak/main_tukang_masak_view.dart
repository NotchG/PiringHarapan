import 'package:flutter/material.dart';
import 'package:piring_harapan/tukang_masak/view/home_section/home_section.dart';
import 'package:piring_harapan/tukang_masak/view/market_section/market_section.dart';
import 'package:piring_harapan/tukang_masak/view/notification_section/notification_section.dart';
import 'package:piring_harapan/tukang_masak/view/profile_section/profile_section.dart';

class MainTukangMasakView extends StatefulWidget {
  @override
  _MainTukangMasakViewState createState() => _MainTukangMasakViewState();
}

class _MainTukangMasakViewState extends State<MainTukangMasakView> {
  int _selectedIndex = 0;

  final List<Widget> _sections = [
    HomeSection(),
    MarketSection(),
    NotificationSection(),
    ProfileSection(),
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
        backgroundColor: Color(0xFFCDE3B5),
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Market',
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
