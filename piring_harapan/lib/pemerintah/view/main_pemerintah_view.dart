import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/view/logbook_view.dart';

class MainPemerintahView extends StatefulWidget {
  const MainPemerintahView({super.key});

  @override
  State<MainPemerintahView> createState() => _MainPemerintahViewState();
}

class _MainPemerintahViewState extends State<MainPemerintahView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LogbookView()),
    );
  }
}
