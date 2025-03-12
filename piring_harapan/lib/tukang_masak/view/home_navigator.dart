import 'package:flutter/material.dart';
import 'package:piring_harapan/tukang_masak/view/home_section/home_section.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({super.key});

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return HomeSection();
              }
              return Text("Eror");
            }
        );
      },
    );
  }
}
