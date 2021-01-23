import 'package:flutter/material.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

Map<Pr0grammTheme, ThemeData> themes = {
  Pr0grammTheme.BEWAEHRTES_ORANGE: ThemeData(
    scaffoldBackgroundColor: Color(0xFF161618),
    brightness: Brightness.dark,
    accentColor: Color(0xFFEE4D2E),
    toggleableActiveColor: Color(0xFFEE4D2E),
    appBarTheme: AppBarTheme(
      color: Color(0xFFEE4D2E),
    ),
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
  ),
  Pr0grammTheme.ANGENEHMES_GRUEN: ThemeData(
    scaffoldBackgroundColor: Color(0xFF161618),
    brightness: Brightness.dark,
    accentColor: Color(0xFF1DB992),
    toggleableActiveColor: Color(0xFF1DB992),
    appBarTheme: AppBarTheme(
      color: Color(0xFF1DB992),
    ),
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
  ),
  Pr0grammTheme.OLIVGRUEN_DES_FRIEDENS: ThemeData(
    brightness: Brightness.dark,
    accentColor: Color(0xFFBFBC06),
    toggleableActiveColor: Color(0xFFBFBC06),
    appBarTheme: AppBarTheme(
      color: Color(0xFFBFBC06),
    ),
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
  ),
  Pr0grammTheme.EPISCHES_BLAU: ThemeData(
    brightness: Brightness.dark,
    accentColor: Color(0xFF008FFF),
    toggleableActiveColor: Color(0xFF008FFF),
    appBarTheme: AppBarTheme(
      color: Color(0xFF008FFF),
    ),
  ),
  Pr0grammTheme.ALTES_PINK: ThemeData(
    brightness: Brightness.dark,
    accentColor: Color(0xFFFF0082),
    toggleableActiveColor: Color(0xFFFF0082),
    appBarTheme: AppBarTheme(
      color: Color(0xFFFF0082),
    ),
  ),
};
