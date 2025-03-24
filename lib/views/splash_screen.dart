import 'dart:async';

import 'package:devhub/utils/colors.dart';
import 'package:devhub/views/dashboard/main_screen.dart';
import 'package:devhub/views/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
    });
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: MyColors.primaryBlue,
      body: SizedBox(
        width: double.maxFinite,
        //height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              height: 140,
              "assets/svg/app_logo.svg",
              //color:  MyColors.primaryBlack,

            ),
          ],
        ),
      )
    ));
  }
}
