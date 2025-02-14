import 'package:flutter/material.dart';

BottomNavigationBarThemeData buildBottomNavBar() {
  return BottomNavigationBarThemeData(
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
  );
}
