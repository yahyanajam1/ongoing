import 'package:devhub/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
          appBar: AppBar(backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
      backgroundColor: Colors.white,
          body:SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child:  Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      //color: MyColors.pinkishOrange,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white,width: 4),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              MyColors.primaryBlue,
                              MyColors.primaryBlue,
                            ]),
                        boxShadow:[
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(1,1),
                              color: MyColors.primaryBlue.withOpacity(0.4))]
                    ),
                    child: Icon(CupertinoIcons.person_2,color: Colors.white,size: 36,),
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 16),
                  child: Column(children: [
                    Text("Michael Mitc",style: TextStyle(color: MyColors.primaryBlack, fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'Lexend'),),
                    Text("Lead UI/Ux Designer",style: TextStyle(color: MyColors.primaryBlack, fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'Lexend'),),
                  ],)
                ),


                SizedBox(height: 12,),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: MaterialButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentLocation(),),);
                    },
                    height: 48,
                    padding: EdgeInsets.only(left: 24,right: 24),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    color: MyColors.primaryBlue,
                    elevation: 1,
                    minWidth: double.maxFinite,
                    highlightElevation: 2,
                    child: Text(("Edit Profile"),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,fontWeight: FontWeight.w500,
                          fontFamily: 'Lexend',
                        )),
                  ),
                ),
                SizedBox(height: 12,),

                ListTile(
                  onTap: (){

                  },
                  leading: Icon(CupertinoIcons.person, color: Colors.black54,),
                  title: Text("Manage Profile",style: TextStyle(color: Colors.black, fontWeight:FontWeight.normal, fontSize: 12,),),
                  trailing: Icon(CupertinoIcons.chevron_forward, color: Colors.black54,),
                ),

                ListTile(
                  onTap: (){

                  },
                  leading: Icon(CupertinoIcons.person, color: Colors.black54,),
                  title: Text("Manage Profile",style: TextStyle(color: Colors.black, fontWeight:FontWeight.normal, fontSize: 12,),),
                  trailing: Icon(CupertinoIcons.chevron_forward, color: Colors.black54,),
                ),
                ListTile(
                  onTap: (){

                  },
                  leading: Icon(CupertinoIcons.person, color: Colors.black54,),
                  title: Text("Manage Profile",style: TextStyle(color: Colors.black, fontWeight:FontWeight.normal, fontSize: 12,),),
                  trailing: Icon(CupertinoIcons.chevron_forward, color: Colors.black54,),
                ),
                ListTile(
                  onTap: (){

                  },
                  leading: Icon(CupertinoIcons.person, color: Colors.black54,),
                  title: Text("Manage Profile",style: TextStyle(color: Colors.black, fontWeight:FontWeight.normal, fontSize: 12,),),
                  trailing: Icon(CupertinoIcons.chevron_forward, color: Colors.black54,),
                ),
                ListTile(
                  onTap: (){

                  },
                  leading: Icon(CupertinoIcons.person, color: Colors.black54,),
                  title: Text("Manage Profile",style: TextStyle(color: Colors.black, fontWeight:FontWeight.normal, fontSize: 12,),),
                  trailing: Icon(CupertinoIcons.chevron_forward, color: Colors.black54,),
                ),
                ListTile(
                  onTap: (){

                  },
                  leading: Icon(CupertinoIcons.person, color: Colors.black54,),
                  title: Text("Manage Profile",style: TextStyle(color: Colors.black, fontWeight:FontWeight.normal, fontSize: 12,),),
                  trailing: Icon(CupertinoIcons.chevron_forward, color: Colors.black54,),
                ),


              ],
            ),
          ),

    ));
  }
}
