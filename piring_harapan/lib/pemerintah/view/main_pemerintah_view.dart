import 'package:easy_animated_indexed_stack/easy_animated_indexed_stack.dart';
import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/controller/review_controller.dart';
import 'package:piring_harapan/pemerintah/view/aspiration_section/aspiration_section_view.dart';
import 'package:piring_harapan/pemerintah/view/home_section/pemerintah_home_view.dart';
import 'package:piring_harapan/pemerintah/view/logbook_navigator.dart';
import 'package:piring_harapan/pemerintah/view/profile_section/profile_section_view.dart';
import 'package:piring_harapan/pemerintah/view/status_section/status_section_view.dart';

final PEMERINTAH_KEY = GlobalKey();

class MainPemerintahView extends StatefulWidget {
  const MainPemerintahView({super.key});

  @override
  State<MainPemerintahView> createState() => _MainPemerintahViewState();
}

class _MainPemerintahViewState extends State<MainPemerintahView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(labelTextStyle: WidgetStateTextStyle.resolveWith(
              (Set<WidgetState> states) {
            final Color color = states.contains(WidgetState.selected) ? Colors.brown : Colors.black54;
            return TextStyle(
                color: color,
              overflow: TextOverflow.ellipsis
            );
          },
        )),
        child: NavigationBar(
          key: PEMERINTAH_KEY,
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(Icons.accessibility),
                label: "Status",
              ),
              NavigationDestination(
                icon: Icon(Icons.history),
                label: "History",
              ),
              NavigationDestination(
                icon: Icon(Icons.star),
                label: "Aspiration",
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: "Profile",
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
            PemerintahHomeView(),
            StatusSectionView(),
            LogbookNavigator(),
            FutureBuilder(
                future: ReviewController.getDatesBySchoolIDAndDate(schoolID: 1),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return AspirationSectionView(review: snapshot.data!.first);
                  }
                  return Text("Loading");
                }
            ),
            ProfileSectionView(),
          ],
        ),
      ),
    );
  }
}
