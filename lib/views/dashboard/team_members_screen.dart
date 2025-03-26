import 'package:devhub/views/secondary/team_member_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/widgets.dart';



class TeamMembersScreen extends StatefulWidget {
  const TeamMembersScreen({super.key});

  @override
  State<TeamMembersScreen> createState() => _TeamMembersScreenState();
}

class _TeamMembersScreenState extends State<TeamMembersScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar:  AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text("Team Members",style: TextStyle(fontSize: 17,letterSpacing: 0.16,color: MyColors.primaryBlack,fontWeight: FontWeight.w600, fontFamily: 'Lexend'),),
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).pop();
            }, icon: Icon(CupertinoIcons.ellipsis_vertical,size: 24,color: Colors.white,))
          ],
        ),
          body: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  SearchBarWidget(
                    controller: TextEditingController(),
                    onChanged: (value) => print('Searching: $value'),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: 16,
                        itemBuilder:(ctx,index){
                          return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> TeamMemberDetailScreen()));
                              },
                              child: ItemTeamMembers());
                        }
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 24,
                right: 20,
                left: 20,
                child:
                    Container(child: authFormButton(
                        title: 'Add Member',
                        height: h*0.068,
                        color: MyColors.primaryBlue,
                        customWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.add_circled, color: Colors.white, size: 18.sp),
                            SizedBox(width: 8.w),
                            authFormButtonText(title: 'Add Member')
                          ],
                        ),
                        pressed: (){
                        }),)
                 ),
            ],
          ),
        ));
  }
}


class ItemTeamMembers extends StatefulWidget {
  const ItemTeamMembers({Key? key}) : super(key: key);

  @override
  State<ItemTeamMembers> createState() => _ItemTeamMembersState();
}

class _ItemTeamMembersState extends State<ItemTeamMembers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8,bottom: 8),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.only(left: 16),
            child: Image.asset("assets/images/hari_profile.png"),
          ),
          SizedBox(
            width: 16,
          ),
          Flexible(
            child: Column(
              children: [

                Container(
                    alignment:Alignment.centerLeft,
                    child: Text("Brooklyn Simmons",style: TextStyle(color: MyColors.primaryBlack,fontWeight: FontWeight.w600,fontSize: 15,letterSpacing: 0.12, fontFamily: 'Lexend'),)),
                Container(
                    alignment:Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 2),
                    child: Text("Leslie Alexander",style: TextStyle(color: MyColors.primaryBlack,fontSize: 12,letterSpacing: 0.12, fontFamily: 'Lexend'),)),

              ],
            ),
          ),

          Container(
              alignment:Alignment.centerLeft,
              margin: EdgeInsets.only(right: 16),
              child: IconButton(onPressed: (){
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  builder: (context) => ActionBottomSheet(),
                  );
              }, icon: Icon(CupertinoIcons.ellipsis_vertical, color: MyColors.primaryBlack,))),

        ],
      ),
    );
  }
}


class ActionBottomSheet extends StatelessWidget {
  const ActionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          SizedBox(height: 8.h),
          _buildActionItem(
            icon: Icons.phone_outlined,
            label: 'Call',

            color: Colors.black,
            onTap: () {
              Navigator.pop(context);
              // Perform call action
            },
          ),
          SizedBox(height: 12.h),
          _buildActionItem(
            icon: Icons.delete_outline,
            label: 'Delete',
            color: Colors.red,
            onTap: () {
              Navigator.pop(context);
              // Perform delete action
            },
          ),
          SizedBox(height: 12.h),


        ],
      ),
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: color, size: 24.sp),
          SizedBox(width: 12.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: color,
              fontFamily: 'Lexend'
            ),
          ),
        ],
      ),
    );
  }
}