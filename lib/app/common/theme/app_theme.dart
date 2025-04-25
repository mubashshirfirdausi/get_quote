import 'package:flutter/material.dart';
import 'package:get_qoute/app/features/settings/presentation/provider/settings_provider.dart';

import '../constants/theme_constants.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Plus Jakarta Sans',
    // primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: kPrimaryColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // backgroundColor: kPrimaryColor,
        // maximumSize: Size(226, 64),
        // fixedSize: Size(22, 63),
        minimumSize: const Size(226, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: kSecondaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: const Size(192, 56),
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,

      // backgroundColor: kbackgroundColor,
      // toolbarHeight: 120,
      // iconTheme: IconThemeData(color: Colors.),
    ),
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    // useMaterial3: true,
  );

  static InputDecoration kTextFieldDecoration = InputDecoration(
    filled: true,
    fillColor: kTextFieldColor,
    hintStyle: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: kLightGreyColor,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kPrimaryColor),
      borderRadius: BorderRadius.circular(10),
    ),

    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kPrimaryColor),
      borderRadius: BorderRadius.circular(10),
    ),
    // border: OutlineInputBorder(
    //   borderSide: BorderSide(color: kPrimaryColor),
    //   borderRadius: BorderRadius.circular(10),
    // ),
  );

  static const gradientDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        kPrimaryColor,
        kTertiaryColor,
      ],
    ),
  );

  static getGradientDecoration(Color color) {
    return BoxDecoration(
      border: Border.all(color: color),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          // kPrimaryColor,
          // kTertiaryColor,

          color.withValues(alpha: 1.5),
          color,
        ],
      ),
    );
  }
}
