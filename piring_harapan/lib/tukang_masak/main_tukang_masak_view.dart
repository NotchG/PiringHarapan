import 'package:easy_animated_indexed_stack/easy_animated_indexed_stack.dart';
import 'package:flutter/material.dart';
import 'package:piring_harapan/tukang_masak/view/home_navigator.dart';
import 'package:piring_harapan/tukang_masak/view/home_section/home_section.dart';
import 'package:piring_harapan/tukang_masak/view/market_section/market_section.dart';
import 'package:piring_harapan/tukang_masak/view/notification_section/notification_section.dart';
import 'package:piring_harapan/tukang_masak/view/profile_section/profile_section_view.dart';

final TUKANGMASAK_KEY = GlobalKey();

class MainTukangMasakView extends StatefulWidget {
  @override
  _MainTukangMasakViewState createState() => _MainTukangMasakViewState();
}

class _MainTukangMasakViewState extends State<MainTukangMasakView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            backgroundColor: Color(0xFFCDE3B5),
            labelTextStyle: WidgetStateTextStyle.resolveWith(
                  (Set<WidgetState> states) {
                final Color color = states.contains(WidgetState.selected) ? Colors.brown : Colors.black54;
                return TextStyle(
                    color: Colors.black54,
                    overflow: TextOverflow.ellipsis
                );
              },
            ),
            iconTheme: WidgetStateProperty.resolveWith(
                  (Set<WidgetState> states) {
                final Color color = states.contains(WidgetState.selected) ? Colors.white : Colors.brown;
                return IconThemeData(
                    color: color
                );
              },
            ),
            indicatorColor: Colors.transparent
        ),
        child: NavigationBar(
            key: TUKANGMASAK_KEY,
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: 'Market',
              ),
              NavigationDestination(
                icon: Icon(Icons.notifications),
                label: 'Notification',
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            }),
      ),
      body: SafeArea(
        top: false,
        child: EasyAnimatedIndexedStack(
          index: _selectedIndex,
          curve: Curves.bounceInOut,
          duration: const Duration(milliseconds: 200),
          children: <Widget>[
            HomeNavigator(),
            MarketSection(),
            NotificationSection(),
            ProfileSectionView(),
          ],
        ),
      ),
    );
  }

}
