import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';



class TeamMembersScreen extends StatefulWidget {
  const TeamMembersScreen({super.key});

  @override
  State<TeamMembersScreen> createState() => _TeamMembersScreenState();
}

class _TeamMembersScreenState extends State<TeamMembersScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
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
          body:Column(
            children: [
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

                          },
                          child: ItemTeamMembers());
                    }
                ),
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
              child: Icon(CupertinoIcons.ellipsis_vertical, color: MyColors.primaryBlack,)),

        ],
      ),
    );
  }
}