import 'package:flutter/material.dart';

class ColorPalettes {
  static const Color primary = Color(0xffB92F23);
  static const Color secondary = Color(0xff2AC64C);

  static const Color success = Color(0xff00B2A0);
  static const Color danger = Color(0xffFF3446);
  static const Color warning = Color.fromRGBO(247, 147, 30, 1.0);
  static const Color info = Color.fromRGBO(52, 152, 219, 1.0);
  static const Color light = Color(0xffF8F9FA);
  static const Color lightGrey = Color(0xffF2F2F2);
  static const Color grey = Color(0xffE2E2E2);
  static const Color darkGrey = Color(0xffAFAFAF);
  static const Color dark = Color(0xff7A7C7E);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
  static Color shadow = ColorPalettes.black.withOpacity(0.1);
  static Color backdrop = ColorPalettes.black.withOpacity(0.7);
}
