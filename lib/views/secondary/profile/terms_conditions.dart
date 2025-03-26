import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';


class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios, color: MyColors.primaryBlack,)),
            title:  Text("Terms & Conditions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Lexend')),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Last update: 05/02/2023',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: 'Lexend'
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Please read these terms of service, carefully before using our app operated by us.',
                    style: TextStyle(
                        fontSize: 14,
                        color: MyColors.primaryBlack,
                        fontFamily: 'Lexend'
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Conditions of Uses',
                    style: TextStyle(
                        fontSize: 18,
                        color: MyColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lexend'
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    '''There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.

If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.

All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.

The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.''',
                    style: TextStyle(fontSize: 14, color: MyColors.primaryBlack, fontFamily: 'Lexend'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
