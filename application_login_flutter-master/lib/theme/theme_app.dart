import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      //backgroundColor: Colors.purple,
      titleTextStyle: TextStyle(
        color: Color.fromARGB(255, 243, 239, 239),   // 👈 color del título
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,   // 👈 color de los íconos
      ),
      foregroundColor: Colors.black,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      //backgroundColor: Color.fromARGB(255, 139, 135, 135),
      titleTextStyle: TextStyle(
        color: Colors.white,  // 👈 color del título
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,  // 👈 color de íconos
      ),
      foregroundColor: Color.fromARGB(255, 246, 246, 246),
    ),
  );
}
