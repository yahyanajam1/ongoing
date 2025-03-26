import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/widgets.dart';


class LeaveDetailsScreen extends StatefulWidget {
  const LeaveDetailsScreen({super.key});

  @override
  State<LeaveDetailsScreen> createState() => _LeaveDetailsScreenState();
}

class _LeaveDetailsScreenState extends State<LeaveDetailsScreen> {
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
            title:  Text("Jane Hawkins",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Lexend')),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 26.h,),
                  _buildDetailSection('Title', 'Sick Leave'),
                  SizedBox(height: 26.h,),
                  _buildDetailSection('Leave Type', 'Medical Leave'),
                  SizedBox(height: 26.h,),
                  _buildDetailSection('Date', 'April 15, 2023 - April 18, 2023'),
                  SizedBox(height: 26.h,),
                  _buildDetailSection('Reason', 'I need to take a medical leave.'),
                  SizedBox(height: 26.h,),
                  _buildDetailSection('Applied on', 'February 20, 2023'),
                  SizedBox(height: 26.h,),
                  _buildDetailSection('Contact Number', '(603) 555-0123'),
                  SizedBox(height: 26.h,),
                  _buildDetailSection('Status', 'Pending'),
                  SizedBox(height: 26.h,),
                  _buildDetailSection('Approved By', 'Michael Mitc'),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton:  Container(
            margin: EdgeInsets.only(
              left: 20, right: 20,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(child:  authFormButton(
                    title: "Reject",
                    height: h*0.068,
                    color: MyColors.appRed,
                    customWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.xmark_circle, color: Colors.white, size: 18.sp),
                        SizedBox(width: 8.w),
                        authFormButtonText(title: 'Reject')
                      ],
                    ),
                    pressed: (){
                    }),),
               SizedBox(width: 12,),
               Flexible(child: authFormButton(
                   title: "Accept",
                   height: h*0.068,
                   color: MyColors.appTeal,
                   customWidget: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(CupertinoIcons.check_mark_circled, color: Colors.white, size: 18.sp),
                       SizedBox(width: 8.w),
                       authFormButtonText(title: 'Accept')
                     ],
                   ),
                   pressed: (){
                   }),)
              ],
            )
          ),

    ));
  }

  Widget _buildDetailSection(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey,
              fontFamily: 'Lexend'
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: MyColors.primaryBlack,
            fontFamily: 'Lexend'
          ),
        ),
      ],
    );
  }

}
