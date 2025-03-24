import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title:  Text("Holiday",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
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
    return Padding(padding: EdgeInsets.only(right: 12,left: 12,bottom: 4,top: 4),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Card(
          color: MyColors.primaryBlue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          elevation: 2,
          child: Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.only(top: 14, bottom: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
                topLeft: Radius.circular(2),
                bottomLeft: Radius.circular(2),
              ),
              shape: BoxShape.rectangle,
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
                       child: Text("January 26 2023", style: TextStyle(color: Colors.black, fontWeight:FontWeight.w500, fontSize: 16,),)),
                 ],
               ),

                Container(
                    margin: EdgeInsets.only(top: 6,left: 12  ),
                    alignment: Alignment.centerLeft,
                    child: Text("Republic Day", style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold, fontSize: 18,),)),


              ],
            ),

          ),
        ),
      ),
    );
  }
}