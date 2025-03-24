import 'package:devhub/views/dashboard/holiday_list_screen.dart';
import 'package:devhub/views/dashboard/leaves_screen.dart';
import 'package:devhub/views/dashboard/main_screen.dart';
import 'package:devhub/views/dashboard/profile_screen.dart';
import 'package:devhub/views/secondary/apply_leave_screen.dart';
import 'package:devhub/views/auth/sign_in_screen.dart';
import 'package:devhub/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

