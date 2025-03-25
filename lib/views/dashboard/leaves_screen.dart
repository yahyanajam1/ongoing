import 'package:devhub/utils/widgets.dart';
import 'package:devhub/views/secondary/apply_leave_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';



class LeavesScreen extends StatefulWidget {
  const LeavesScreen({super.key});

  @override
  State<LeavesScreen> createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<LeavesScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  final List<Map<String, dynamic>> leaveData = [
    {"title": "Leave\nBalance", "value": "20", "color": Colors.blue},
    {"title": "Leave\nApproved", "value": "2", "color": Colors.green},
    {"title": "Leave\nPending", "value": "4", "color": Colors.teal},
    {"title": "Leave\nCancelled", "value": "10", "color": Colors.red},
  ];


  @override
  void initState() {
    // TODO: implement initState
    _tabController= TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text("All Leaves",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Lexend')),

        actions: [
          IconButton(icon: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: MyColors.primaryBlack, width: 1.5)
            ),
            child:  Icon(Icons.add, color: Colors.black, size: 20,),), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ApplyLeaveScreen()));
          }),
          IconButton(icon: Icon(Icons.tune, color: Colors.black), onPressed: () {

            filterLeaveBottomSheet(context);

          }),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:  Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Prevents scrolling inside grid
                itemCount: leaveData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 cards per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5, // Adjusts height
                ),
                itemBuilder: (context, index) {
                  final item = leaveData[index];
                  return leaveCard(item["title"], item["value"], item["color"]);
                },
              ),
            ),

            // Tabs Section
            Container(
              height: 52.h,
              margin: EdgeInsets.only(left: 20, right: 20),
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
                  Tab(text: "Upcoming",),
                  Tab(text: "Past"),
                  Tab(text: "Team Leave"),
                ],
              ),
            ),
            SizedBox(height: 16),

            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, i){
                return leaveListCard("Apr 15, 2023 - Apr 18, 2023", "3 Days", "16", "Martin Deo");
              },
            ),

          ],
        ),
      ),
    );
  }

  Widget leaveCard(String title, String value, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Lexend')),
          Spacer(),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
  //
  Widget leaveListCard(String date, String days, String balance, String approvedBy) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date & Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date", style: TextStyle(color: Colors.black54, fontSize: 12.sp, fontFamily: 'Lexend')),
                  SizedBox(height: 4),
                  Text(date, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, fontFamily: 'Lexend')),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Approved",
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontFamily: 'Lexend', fontSize: 10.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),

          // Apply Days, Balance, Approved By
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              columnInfo("Apply Days", days),
              columnInfo("Leave Balance", balance),
              columnInfo("Approved By", approvedBy, isBold: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget columnInfo(String title, String value, {bool isBold = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.black54, fontSize: 12, fontFamily: 'Lexend')),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Lexend',
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  void filterLeaveBottomSheet(BuildContext context,) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (BuildContext context) {
        return LeaveFilterBottomSheet();
      },
    );
  }

}


class LeaveFilterBottomSheet extends StatefulWidget {
  const LeaveFilterBottomSheet({super.key});

  @override
  State<LeaveFilterBottomSheet> createState() => _LeaveFilterBottomSheetState();
}

class _LeaveFilterBottomSheetState extends State<LeaveFilterBottomSheet> {
  List<String> statusOptions = ['Approved', 'Unapproved', 'Pending'];
  List<String> leaveTypes = ['Sick Leave', 'Planned Leave', 'Holiday'];
  String? selectedTeamMember = 'Alexa Williams';

  Map<String, bool> selectedStatus = {};
  Map<String, bool> selectedLeaveType = {};

  @override
  void initState() {
    super.initState();
    for (var status in statusOptions) {
      selectedStatus[status] = status == 'Approved';
    }
    for (var type in leaveTypes) {
      selectedLeaveType[type] = type == 'Sick Leave';
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          _buildSection('Status', statusOptions, selectedStatus),
          _buildSection('Leave Type', leaveTypes, selectedLeaveType),
          _buildTeamMemberDropdown(),
          SizedBox(height: 20.h),
          Row(
            children: [
             Flexible(child:  authFormButton(
                 title: "Reset",
                 height: h*0.068,
                 color: MyColors.whiteTwo,
                 customWidget: authFormButtonText(title: "Reset", textColor: MyColors.primaryBlack),
                 pressed: () {
               setState(() {
                 for (var key in selectedStatus.keys) {
                   selectedStatus[key] = false;
                 }
                 for (var key in selectedLeaveType.keys) {
                   selectedLeaveType[key] = false;
                 }
                 selectedTeamMember = null;
               });
             }),),
              SizedBox(width: 12.w),
              Flexible(
                child: authFormButton(
                    title: "Apply",
                    height: h*0.068,
                    color: MyColors.primaryBlue,
                    pressed: () {
                      Navigator.pop(context);

                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Filter',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lexend'
          ),
        ),
        IconButton(
          icon: Icon(CupertinoIcons.xmark_circle, size: 20.sp, color: MyColors.primaryBlack,),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<String> options, Map<String, bool> selectedMap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lexend'
          ),
        ),
        ...options.map((option) => CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(option, style: TextStyle(fontSize: 14.sp)),
          value: selectedMap[option],
          activeColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              selectedMap[option] = value!;
            });
          },
        )),
      ],
    );
  }

  Widget _buildTeamMemberDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Team Member',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lexend'
          ),
        ),
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          value: selectedTeamMember,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: MyColors.primaryBlue, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: MyColors.primaryBlue, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: MyColors.primaryBlue, width: 1),
            ),
          ),
          items: ['Alexa Williams', 'John Doe', 'Jane Smith']
              .map((name) => DropdownMenuItem(
            value: name,
            child: Text(name, style: TextStyle(fontSize: 14.sp)),
          ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedTeamMember = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildButton(String text, Color color, Color textColor, VoidCallback onPressed) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

