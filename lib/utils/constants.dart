import 'package:devhub/utils/colors.dart';
import 'package:devhub/views/dashboard/holiday_list_screen.dart';
import 'package:devhub/views/dashboard/home_screen.dart';
import 'package:devhub/views/dashboard/leaves_screen.dart';
import 'package:devhub/views/dashboard/profile_screen.dart';
import 'package:flutter/material.dart';

List<Widget> screens = [
  const HomeScreen(),
  const LeavesScreen(),
  const LeavesScreen(),
  const HolidayListScreen(),
  const ProfileScreen(),
];

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    // backgroundColor: lightBG,
    primaryColor: Colors.white,
    hintColor: Colors.white,
    // cursorColor: lightAccent,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      // bodyMedium: TextStyle(fontFamily: 'BalooBhaina2', fontSize: 18),
      bodyMedium: TextStyle(fontFamily: 'BalooBhaijaan2', fontSize: 18),
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(
            color: MyColors.primaryBlack,
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
            // fontFamily: 'BalooBhaina2'
            fontFamily: 'BalooBhaijaan2'),
      ).bodyMedium,
      titleTextStyle: TextTheme(
        titleLarge: TextStyle(
            color: MyColors.primaryBlack,
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
            // fontFamily: 'BalooBhaina2'
            fontFamily: 'BalooBhaijaan2'),
      ).titleLarge,
    ),
    // colorSchemeSeed: kMainColor,
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // backgroundColor: darkBG,
    primaryColor: MyColors.primaryBlack,
    hintColor: MyColors.primaryBlack,
    scaffoldBackgroundColor: MyColors.primaryBlack,
    // cursorColor: darkAccent,
    textTheme: const TextTheme(
      // bodyMedium: TextStyle(fontFamily: 'BalooBhaina2', fontSize: 18),
      bodyMedium: TextStyle(fontFamily: 'BalooBhaijaan2', fontSize: 18),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
      toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w800,
            // fontFamily: 'BalooBhaina2'
            fontFamily: 'BalooBhaijaan2'),
      ).bodyMedium,
      titleTextStyle: TextTheme(
        titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w800,
            // fontFamily: 'BalooBhaina2'
            fontFamily: 'BalooBhaijaan2'),
      ).titleLarge,
    ),
    useMaterial3: true,
  );
}