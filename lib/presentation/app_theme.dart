import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color greenDark = const Color(0xff359744);
  static Color greenLight = const Color(0xff8ac053);
  static Color greenMarine = const Color(0xffa1cc8c);
  static Color greenAqua = const Color(0xffcce484);
  static Color whiteGreen = const Color(0xfff9fbf1);
  static Color black = const Color(0xFF0D0D1F);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: GoogleFonts.rubikTextTheme(),
    backgroundColor: whiteGreen,
    scaffoldBackgroundColor: whiteGreen,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actionsIconTheme: IconThemeData(
        color: greenDark,
      ),
      iconTheme: IconThemeData(
        color: greenDark,
      ),
      titleTextStyle: TextStyle(
        color: greenDark,
        fontWeight: FontWeight.w600,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: greenDark, circularTrackColor: greenMarine, refreshBackgroundColor: greenLight),
  );
}
