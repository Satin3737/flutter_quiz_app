import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.lato(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}
