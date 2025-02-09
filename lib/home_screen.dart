import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Text(
        "Home",
        style: GoogleFonts.elMessiri(
          fontSize: 60.0,
          color: Color(0xFFE2BE7F),
        ),
      ),
    ),);
  }
}
