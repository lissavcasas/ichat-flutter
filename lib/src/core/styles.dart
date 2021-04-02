import 'package:flutter/material.dart';

class Styles {
  // COLOR
  static const Color primary = Color(0xff4346E9);

  // TEXTSTYLE
  static const TextStyle splashTitle = TextStyle(
    color: Colors.white,
    fontSize: 46,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle authTitle = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle greyText = TextStyle(
    color: Colors.black54,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle linkText = TextStyle(
    color: Styles.primary,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle btnText = TextStyle(
    color: Colors.white,
    fontFamily: 'Monserrat',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
  );

  // BOX DECORATION
  static BoxDecoration btnDecoration = BoxDecoration(
    color: Styles.primary,
    borderRadius: BorderRadius.circular(15.0),
  );

  // BORDER RADIUS
  static BorderRadius btnRadius = BorderRadius.circular(15.0);

  // PADDING
  static const EdgeInsetsGeometry bodyPadding = const EdgeInsets.symmetric(
    horizontal: 25.0,
  );
}
