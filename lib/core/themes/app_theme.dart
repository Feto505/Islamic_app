import 'package:flutter/material.dart';

class AppThemeManager {
  static const Color primaryColor = Color(0xFFB7935F);
  static const Color primaryDarkColor = Color(0xFFFACC1D);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: "ElMessiri",
          color: Color(0xff242424)),
      bodyLarge: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          fontFamily: "ElMessiri",
          color: Color(0xff242424)),
      bodyMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          fontFamily: "ElMessiri",
          color: Color(0xff242424)),
      bodySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontFamily: "ElMessiri",
          color: Color(0xff242424)),
    ),
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        fontFamily: "ElMessiri",
        color: Color(0xff242424),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xff000000),
      selectedIconTheme: IconThemeData(
        color: Color(0xff000000),
        size: 35,
      ),
      selectedLabelStyle: TextStyle(
        fontFamily: "ElMessiri",
        fontWeight: FontWeight.w800,
        fontSize: 13,
      ),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Color(0xffffffff),
        size: 28,
      ),
      unselectedItemColor: Color(0xffffffff),
      unselectedLabelStyle: TextStyle(
        fontFamily: "ElMessiri",
        fontWeight: FontWeight.w800,
        fontSize: 11,
      ),
      //type: BottomNavigationBarType.shifting
    ),
    dividerTheme: DividerThemeData(color: primaryColor, space: 10),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: "ElMessiri",
          color: Colors.white),
      bodyLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        fontFamily: "ElMessiri",
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        fontFamily: "ElMessiri",
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: "ElMessiri",
        color: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        fontFamily: "ElMessiri",
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff141a2e),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryDarkColor,
      selectedIconTheme: IconThemeData(
        color: primaryDarkColor,
        size: 35,
      ),
      selectedLabelStyle: TextStyle(
          fontFamily: "ElMessiri",
          fontWeight: FontWeight.w800,
          fontSize: 13,
          color: primaryDarkColor),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Color(0xffffffff),
        size: 28,
      ),
      unselectedItemColor: Color(0xffffffff),
      unselectedLabelStyle: TextStyle(
        fontFamily: "ElMessiri",
        fontWeight: FontWeight.w800,
        fontSize: 11,
      ),
      //type: BottomNavigationBarType.shifting
    ),
    dividerTheme: DividerThemeData(color: primaryDarkColor, space: 10),
  );
}
