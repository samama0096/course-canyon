import 'package:elearn/utils/themes/swatch.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/fixed_constants.dart';

class AppTheme {
  static ThemeData apptheme() => ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(smallBorderRadius)))),
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: backgroundDullWhite.withOpacity(0.3),
            hintStyle: TextStyle(
                color: purplePrimary.withOpacity(0.8),
                fontSize: 14,
                fontStyle: FontStyle.italic),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(largelBorderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(medBorderRadius),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(smallBorderRadius),
            )),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            iconTheme: IconThemeData(
              color: Colors.black,
              size: 30,
            )),
        primaryColor: purplePrimary,
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: purplePrimary,
            onPrimary: Colors.white,
            secondary: errorOrange,
            onSecondary: Colors.white,
            error: errorOrange,
            onError: Colors.black87,
            background: backgroundDullWhite,
            onBackground: Colors.black,
            surface: surfacePurpleColor,
            onSurface: Colors.black),
        primarySwatch: generateMaterialColor(purplePrimary),
        scaffoldBackgroundColor: Colors.white,
      );
}

var cursorColor = Colors.blueGrey;
var purplePrimary = const Color.fromARGB(255, 7, 102, 235);
var darkPurplePrimary = const Color.fromARGB(255, 15, 87, 188);
var lightOrangesecondary = const Color(0xFFF4B942);
var errorOrange = const Color(0xFFF5811F);
var backgroundDullWhite = const Color.fromARGB(255, 234, 247, 242);
var surfacePurpleColor = const Color.fromARGB(255, 168, 169, 245);
