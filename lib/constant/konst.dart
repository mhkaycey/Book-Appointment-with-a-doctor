import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color.fromRGBO(165, 214, 167, 1);
const Color yellowClr = Color(0xFFffB746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const Color primaryClr = bluishClr;

TextStyle get textStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get textStyleSmall {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get textStyleLight {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
  );
}

TextStyle get subtitleStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
  );
}
