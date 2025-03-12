import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/view/history_section/logbook_view.dart';

class LogbookNavigator extends StatefulWidget {
  const LogbookNavigator({super.key});

  @override
  State<LogbookNavigator> createState() => _LogbookNavigatorState();
}

class _LogbookNavigatorState extends State<LogbookNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return LogbookView();
            }
            return Text("Eror");
          }
        );
      },
    );
  }
}
