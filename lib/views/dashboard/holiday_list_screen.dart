import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';



class HolidayListScreen extends StatefulWidget {
  const HolidayListScreen({super.key});

  @override
  State<HolidayListScreen> createState() => _HolidayListScreenState();
}

class _HolidayListScreenState extends State<HolidayListScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title:  Text("Holiday List",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Lexend')),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 12,
                itemBuilder:(ctx,index){
                  return HolidayProduct(
                    onTap: () {  },
                  );
                }
            ))
          ],
        ),
      ),
    );
  }
}




class HolidayProduct extends StatefulWidget {

  final Function()? onTap;
  // final Function()? onTrackOrderTap;
  // final Function()? onViewDetailTap;


  const HolidayProduct({Key? key,
    required this.onTap,
    // required this.onTrackOrderTap,
    // required this.onViewDetailTap,
  }) : super(key: key);



  @override
  State<HolidayProduct> createState() => _HolidayProductState();
}

class _HolidayProductState extends State<HolidayProduct> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
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
          padding: EdgeInsets.only(top: 16, bottom: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
              topLeft: Radius.circular(2),
              bottomLeft: Radius.circular(2),
            ),
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.white),
            //border: Border.all(color: MyColors.cyanGreen,width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

             Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 SizedBox(width: 8,),
                 Icon(CupertinoIcons.calendar_today, color: MyColors.primaryBlack,),
                 Container(
                     margin: EdgeInsets.only(left: 4),
                     alignment: Alignment.centerLeft,
                     child: Text("January 26 2023", style: TextStyle(color: Colors.black, fontWeight:FontWeight.w500, fontSize: 16, fontFamily: 'Lexend'),)),
               ],
             ),

              Container(
                  margin: EdgeInsets.only(top: 8,left: 12  ),
                  alignment: Alignment.centerLeft,
                  child: Text("Republic Day", style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold, fontSize: 18,fontFamily: 'Lexend'),)),

            ],
          ),

        ),
      ),
    );
  }
}