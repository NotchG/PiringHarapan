import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piring_harapan/pemerintah/view/main_pemerintah_view.dart';
import 'package:piring_harapan/tukang_masak/main_tukang_masak_view.dart';
import 'package:piring_harapan/login_page/register_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: _buildTheme(),
    home: RegisterPage(),
  ));
}

ThemeData _buildTheme() {
  var baseTheme = ThemeData();

  return baseTheme.copyWith(
    textTheme: GoogleFonts.soraTextTheme(baseTheme.textTheme),
  );
}
