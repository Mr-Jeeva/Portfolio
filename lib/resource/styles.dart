import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/resource/colors.dart';

class TxtStyle {
  var neonText =
      GoogleFonts.orbitron(color: AppColors().neonColor, fontSize: 14);

  boldBlack(context) =>
      const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

  boldWhite(context) =>
      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
}
