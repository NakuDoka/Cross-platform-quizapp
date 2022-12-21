import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// COLORS
var blue2 = const Color.fromRGBO(66, 87, 178, 1);
var blue1 = const Color.fromRGBO(33, 48, 87, 1);
var blue = const Color.fromRGBO(66, 133, 224, 1);
var yellow = const Color.fromRGBO(250, 187, 5, 1);
var red = const Color.fromRGBO(233, 66, 53, 1);
var green = const Color.fromRGBO(52, 168, 83, 1);
var grey = const Color.fromRGBO(167, 167, 167, 1);

/// FONTS
var headlineBlue = GoogleFonts.dmSans(color: blue1, fontWeight: FontWeight.w500);
var headlineWhite = GoogleFonts.dmSans(color: Colors.white, fontWeight: FontWeight.w500);
var textGrey = GoogleFonts.dmSans(color: grey, fontWeight: FontWeight.w500, fontSize: 22);
var textWhite = GoogleFonts.dmSans(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 28);
var textBlack = GoogleFonts.dmSans(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 28);
var textYellow = GoogleFonts.dmSans(color: yellow, fontWeight: FontWeight.w500, fontSize: 20);
var textRed = GoogleFonts.dmSans(color: red, fontWeight: FontWeight.w500, fontSize: 45);

/// Extra
Map<String, Color> colors = {"Blue": blue, "Yellow": yellow, "Green": green, "Red": red};
