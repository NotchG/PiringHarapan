import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/view/profile_section/profile_section_view.dart';

class ProfileNavigator extends StatefulWidget {
  const ProfileNavigator({super.key});

  @override
  State<ProfileNavigator> createState() => _ProfileNavigatorState();
}

class _ProfileNavigatorState extends State<ProfileNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return ProfileSectionView();
              }
              return Text("Eror");
            }
        );
      },
    );
  }
}
