import 'package:devhub/utils/constants.dart';
import 'package:devhub/utils/theme_notifier.dart';
import 'package:devhub/views/dashboard/holiday_list_screen.dart';
import 'package:devhub/views/dashboard/leaves_screen.dart';
import 'package:devhub/views/dashboard/main_screen.dart';
import 'package:devhub/views/dashboard/profile_screen.dart';
import 'package:devhub/views/secondary/apply_leave_screen.dart';
import 'package:devhub/views/auth/sign_in_screen.dart';
import 'package:devhub/views/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(DevicePreview(
      enabled: false,
      builder: (context)=>const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder:(context, child){
        return ChangeNotifierProvider(create: (context) => ThemeNotifier(MyTheme.lightTheme, false),
          child: Consumer<ThemeNotifier>(builder: (context, themeNotifier, child){
            return  MaterialApp(
              title: 'DevHub',
              debugShowCheckedModeBanner: false,
              // theme: ThemeData(
              //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              //   useMaterial3: true,
              // ),
              theme: themeNotifier.currentTheme,
              darkTheme: MyTheme.darkTheme,
              themeMode: ThemeMode.system,
              home: SplashScreen(),
            );
          }),);





      },
    );
  }
}



