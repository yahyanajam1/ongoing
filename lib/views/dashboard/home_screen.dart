import 'package:devhub/views/secondary/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors.dart';
import '../../utils/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:   Row(
          children: [
            Container(
              height: 46,
              width: 46,
              child: Image.asset("assets/images/harry.png",),
            ),
            SizedBox(width: 12,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment:Alignment.centerLeft,
                    child: Text("Michale Mitc",style: TextStyle(color: MyColors.primaryBlack,fontWeight: FontWeight.bold,fontSize: 16, fontFamily: 'Lexend'),)),
                Container(
                    alignment:Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 4),
                    child: Text("Lead UI/UX Designer",style: TextStyle(color: MyColors.primaryBlack,fontSize: 14, fontFamily: 'Lexend'),)),

              ],
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
            },
            child: Container(
              height: 28,
              width: 28,
              margin:  EdgeInsets.only(right: 20),
              // padding: EdgeInsets.only(top: 10,left: 6,bottom: 8,right: 6),
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(16),
              // ),
              child: SvgPicture.asset(
                height: 24,
                "assets/svg/notification.svg",
                color:  MyColors.primaryBlack,
              ),
            ),
          ),

        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*
            Row(
              children: [

                SizedBox(width: 12,),

                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          alignment:Alignment.centerLeft,
                          child: Text("Michale Mitc",style: TextStyle(color: MyColors.primaryBlack,fontWeight: FontWeight.bold,fontSize: 14),)),
                      Container(
                          alignment:Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 4),
                          child: Text("Lead UI/UX Designer",style: TextStyle(color: MyColors.primaryBlack,fontSize: 12),)),

                    ],
                  ),
                ),
                SizedBox(width: 16,),
                GestureDetector(
                  onTap: (){
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    // padding: EdgeInsets.only(top: 10,left: 6,bottom: 8,right: 6),
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   borderRadius: BorderRadius.circular(16),
                    // ),
                    child: SvgPicture.asset(
                      height: 24,
                      "assets/svg/notification.svg",
                      color:  MyColors.primaryBlack,
                    ),
                  ),
                ),
                SizedBox(width: 16,),
              ],
            ),
            */

            SizedBox(
              height: 16,
            ),

            Container(
              margin: EdgeInsets.only(left: 16),
              child: LinearCalendar(),
            ),

            SizedBox(
              height: 24,
            ),

            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "Today Attendance",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Lexend',
                    color: MyColors.primaryBlack,
                    fontSize: 16),
              ),
            ),

            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.h,
                mainAxisSpacing: 16.h,
                childAspectRatio: 1.2.h,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  attendanceCard(Icons.login, "Check In", "10:20 am", "On Time"),
                  attendanceCard(Icons.logout, "Check Out", "07:00 pm", "Go Home"),
                  attendanceCard(Icons.timer, "Break Time", "00:30 min", "Avg Time 30 min"),
                  attendanceCard(Icons.calendar_today, "Total Days", "28", "Working Days"),
                ],
              ),
            ),


            SizedBox(height: 24,),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today Attendance",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lexend',
                        color: MyColors.primaryBlack,
                        fontSize: 16),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lexend',
                        color: MyColors.primaryBlue,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
              child: activityCard(Icons.login, "Check In", "10:00 am", "April 17, 2023", "On Time"),
            ),
            SizedBox(height: 12),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: activityCard(Icons.timer, "Break In", "12:30 am", "April 17, 2023", "On Time")),

          ],
        ),
      ),
    );
  }

  Widget activityCard(IconData icon, String title, String time, String date, String status) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16,fontFamily:  'Lexend')),
                  Text(date, style: TextStyle(color: Colors.grey, fontSize: 13, fontFamily: 'Lexend')),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(time, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'Lexend')),
              Text(status, style: TextStyle(color: Colors.grey, fontSize: 13, fontFamily: 'Lexend')),
            ],
          ),
        ],
      ),
    );
  }

  Widget attendanceCard(IconData icon, String title, String time, String subtitle) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue),
              SizedBox(width: 8),
              Text(title, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, fontFamily: 'Lexend')),
            ],
          ),
          SizedBox(height: 10),
          Text(time, style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, fontFamily: 'Lexend')),
          SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: 14, fontFamily: 'Lexend')),
        ],
      ),
    );
  }



}
