import 'package:flutter/material.dart';

final ThemeData light = ThemeData(
    primaryColor: Colors.deepPurple,
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.deepPurple,
      secondary: Colors.black,
      error: Colors.redAccent,
      surfaceTint: Colors.transparent,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        elevation: 3,
        backgroundColor: Colors.deepPurple,
        shadowColor: const Color.fromRGBO(39, 63, 219, 0.09),
        centerTitle: true,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22,
          color: Colors.white,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepPurple,
      selectedLabelStyle: TextStyle(
        color: Colors.deepPurple,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      selectedIconTheme: IconThemeData(color: Colors.deepPurple, size: 28),
      unselectedItemColor: Colors.grey,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey.shade400,
        size: 24,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.grey.shade600,
        fontSize: 14,
      ),
      elevation: 10,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ));

final ThemeData dark = ThemeData(
    primaryColor: const Color.fromARGB(255, 192, 156, 255),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Color.fromARGB(255, 192, 156, 255),
      secondary: Colors.white,
      error: Colors.redAccent,
      surfaceTint: Colors.transparent,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 21, 21, 21),
    appBarTheme: AppBarTheme(
        elevation: 3,
        backgroundColor: Color.fromARGB(255, 192, 156, 255),
        shadowColor: const Color.fromARGB(255, 170, 173, 198),
        centerTitle: true,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22,
          color: Colors.white,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color.fromARGB(255, 192, 156, 255),
      selectedLabelStyle: TextStyle(
        color: Color.fromARGB(255, 192, 156, 255),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      selectedIconTheme:
          IconThemeData(color: Color.fromARGB(255, 192, 156, 255), size: 28),
      unselectedItemColor: Colors.grey,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey.shade400,
        size: 24,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.grey.shade600,
        fontSize: 14,
      ),
      elevation: 10,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ));

// final ThemeData dark = ThemeData(
//   primaryColor: Colors.indigo,
//   colorScheme: const ColorScheme.light().copyWith(
//     primary: Colors.indigo,
//     secondary: Colors.white,
//     error: Colors.redAccent,
//     surfaceTint: Colors.transparent,
//   ),
//   scaffoldBackgroundColor: const Color.fromARGB(255, 59, 58, 58),
//   shadowColor: Colors.white,
//   appBarTheme: AppBarTheme(
//       elevation: 3,
//       backgroundColor: Color.fromARGB(255, 59, 58, 58),
//       shadowColor: Colors.white,
//       foregroundColor: Colors.white),
// );
