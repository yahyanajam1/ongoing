import 'package:devhub/views/auth/verification_screen.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/widgets.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  int selectedIndex = 1; // 0 for Email, 1 for Phone

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios, color: MyColors.primaryBlack,)),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [

            Column(
              children: [


                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                        children:[
                          TextSpan(
                            text: "Forgot Password 🤔",
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: MyColors.primaryBlack, fontWeight: FontWeight.w600, fontSize: 26.sp, fontFamily: 'Lexend'),
                          ),
                        ]
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(
                  height: 8,
                ),

                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  child: Text("Select which contact details should we use to reset your password",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14, color: MyColors.appGrey, fontFamily: 'Lexend'),),
                ),

                SvgPicture.asset(
                  height: h*0.42,
                  'assets/svg/forgot_password_pana.svg',
                  fit: BoxFit.contain,
                ),

                SizedBox(
                  height: 16.h,
                ),


                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child:   buildSelectorCard(
                    icon: Icons.email_outlined,
                    title: 'Email',
                    subtitle: 'michael.mitc@example.com',
                    isSelected: selectedIndex == 0,
                    onTap: () => setState(() => selectedIndex = 0),
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: buildSelectorCard(
                    icon: Icons.phone_outlined,
                    title: 'Phone Number',
                    subtitle: '(217) 555-0113',
                    isSelected: selectedIndex == 1,
                    onTap: () => setState(() => selectedIndex = 1),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h*0.12,
            ),

          ],
        ),
      ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton:  Container(
            margin: EdgeInsets.only(
              left: 20, right: 20,),
            child:  authFormButton(
                title: "Continue",
                height: h*0.068,
                pressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationScreen()));
                }),
          ),
    ));
  }

  Widget buildSelectorCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          //color: isSelected ? MyColors.primaryBlue.withOpacity(0.1) : Colors.white,
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? MyColors.primaryBlue : Colors.grey.shade300,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding:  EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: isSelected ? MyColors.primaryBlue : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: isSelected ? Colors.white : Colors.black54),
            ),
             SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primaryBlack,
                      fontFamily: 'Lexend'
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: MyColors.primaryBlack,
                      fontFamily: 'Lexend'
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? MyColors.primaryBlue : Colors.grey,
                  width: 2.w,
                ),
              ),
              child: isSelected
                  ? Icon(Icons.circle, color: MyColors.primaryBlue, size: 16.sp)
                  : Icon(Icons.circle, color: MyColors.appGrey, size: 16.sp),
            ),
          ],
        ),
      ),
    );
  }

}
