import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/widgets.dart';


class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController= TabController(length: 3, vsync: this);
    super.initState();
  }

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
            title:  Text("My Profile",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Lexend')),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  // Tabs Section
                  Container(
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: MyColors.appGrey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TabBar(
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      labelColor: Colors.white,
                      unselectedLabelColor: MyColors.primaryBlack,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: TextStyle(fontFamily: 'Lexend', fontSize: 14),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MyColors.primaryBlue),
                      tabs: [
                        Tab(text: "Personal",),
                        Tab(text: "Professional"),
                        Tab(text: "Documents"),
                      ],
                    ),
                  ),

                  Expanded(child: TabBarView(
                    controller: _tabController,
                    children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 26.h,),
                        _buildDetailSection('Full Name', 'Michael Mitc'),
                        SizedBox(height: 26.h,),
                        _buildDetailSection('Email Address', 'michael.mitc@example.com'),
                        SizedBox(height: 26.h,),
                        _buildDetailSection('Phone Number', '(603) 555-0123'),
                        SizedBox(height: 26.h,),
                        _buildDetailSection('Address', 'Street 12 W, St. Utica, Pennsylvania 57867'),
                        SizedBox(height: 26.h,),
                        _buildDetailSection('Contact Number', '(603) 555-0123'),
                        SizedBox(height: 26.h,),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 26.h,),
                        _buildDetailSection('Employee ID', '7879987'),
                        SizedBox(height: 26.h,),
                        _buildDetailSection('Designation', 'Lead UI/UX Designer'),
                        SizedBox(height: 26.h,),
                        _buildDetailSection('Company Email Address', 'michael.mitc@example.com'),
                        SizedBox(height: 26.h,),
                        _buildDetailSection('Employee Type', 'Permanent'),
                        SizedBox(height: 26.h,),
                        _buildDetailSection('Department', 'Design'),
                        SizedBox(height: 26.h,),
                        _buildDetailSection('Company Experience', '2 Year 5 Months'),
                        SizedBox(height: 26.h,),
                        _buildDetailSection('Office Time', '10:00 am to 07:00 pm'),
                        SizedBox(height: 26.h,),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        _documentItem('Offer Letter'),
                        _documentItem('Appointment Letter'),
                        _documentItem('Bond Agreement'),
                        _documentItem('Appraisal Letter'),
                        _documentItem('Salary Slip'),
                      ],
                    )
                  ],))

                ],
              ),
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

  Widget _documentItem(String title){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          // Left Icon in Circle
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child:  Icon(CupertinoIcons.doc_plaintext, color: MyColors.primaryBlack),
          ),
          const SizedBox(width: 12),

          // Document Title
          Expanded(
            child: Text(
              title,
              style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Lexend', color: MyColors.primaryBlack),
            ),
          ),

          // Right Download Icon
          Icon(CupertinoIcons.arrow_down_doc, color: Colors.black54),
        ],
      ),
    );
  }

}
