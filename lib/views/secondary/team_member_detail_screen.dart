import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';


class TeamMemberDetailScreen extends StatefulWidget {
  const TeamMemberDetailScreen({super.key});

  @override
  State<TeamMemberDetailScreen> createState() => _TeamMemberDetailScreenState();
}

class _TeamMemberDetailScreenState extends State<TeamMemberDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios, color: MyColors.primaryBlack,)),
            title:  Text("Leave Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Lexend')),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 12,
                    itemBuilder:(ctx,index){
                      return AttendanceCard(
                        date: 'April 12, 2023',
                        checkInTime: '09:30 am',
                        checkOutTime: '07:10 pm',
                      );
                    }
                ))
              ],
            ),
          ),
    ));
  }
}


class AttendanceCard extends StatelessWidget {
  final String date;
  final String checkInTime;
  final String checkOutTime;

  const AttendanceCard({
    Key? key,
    required this.date,
    required this.checkInTime,
    required this.checkOutTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: MyColors.primaryBlue,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
                topLeft: Radius.circular(2),
                bottomLeft: Radius.circular(2),
              ),
              border: Border.all(color: Colors.white),
              shape: BoxShape.rectangle,

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Lexend'
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    _buildTimeCard(Icons.login, checkInTime),
                    SizedBox(width: 12.w),
                    _buildTimeCard(Icons.logout, checkOutTime),
                  ],
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildTimeCard(IconData icon, String time) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: MyColors.primaryBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(icon, color: Colors.blue, size: 18.sp),
        ),
        SizedBox(width: 8.w),
        Text(
          time,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: MyColors.primaryBlack,
            fontFamily: 'Lexend'
          ),
        ),
      ],
    );
  }
}

