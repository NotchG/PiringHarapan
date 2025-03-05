import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piring_harapan/pemerintah/view/logbook_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: _buildTheme(),
    home: LogbookView(),
  ));
}

ThemeData _buildTheme() {
  var baseTheme = ThemeData();

  return baseTheme.copyWith(
    textTheme: GoogleFonts.soraTextTheme(baseTheme.textTheme),
  );
}
