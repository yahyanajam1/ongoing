import 'package:devhub/utils/colors.dart';
import 'package:devhub/utils/widgets.dart';
import 'package:devhub/views/secondary/profile/change_password_screen.dart';
import 'package:devhub/views/secondary/profile/my_profile_screen.dart';
import 'package:devhub/views/secondary/profile/privacy_policy_screen.dart';
import 'package:devhub/views/secondary/profile/terms_conditions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
          appBar: AppBar(backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: 0,
          ),
      backgroundColor: Colors.white,
          body:SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child:  Column(
              children: [
                SizedBox(height: 48.h,),

                Container(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    children: [
                      // Profile Image
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/053/827/679/small/a-man-with-blonde-hair-and-blue-eyes-is-standing-in-a-forest-free-photo.jpg'), // Replace with actual image URL
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Camera Icon
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: MyColors.primaryBlue,
                            shape: BoxShape.rectangle, 
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white,),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: const Icon(
                            CupertinoIcons.camera,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*
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
                */

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 16),
                  child: Column(children: [
                    Text("Michael Mitc",style: TextStyle(color: MyColors.primaryBlack, fontSize: 18,fontWeight: FontWeight.w600, fontFamily: 'Lexend'),),
                    Text("Lead UI/Ux Designer",style: TextStyle(color: MyColors.primaryBlack, fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'Lexend'),),
                  ],)
                ),


                SizedBox(height: 12,),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: authFormButton(title: "Edit Profile",
                      height: h*0.068,
                      pressed: (){

                      }),
                ),
                SizedBox(height: 20,),

                _buildMenuItem(
                  icon: Icons.person_outline,
                  title: 'My Profile',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfileScreen()));
                  },
                ),
                _buildMenuItem(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordScreen()));

                  },
                ),
                _buildMenuItem(
                  icon: Icons.article_outlined,
                  title: 'Terms & Conditions',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsConditionsScreen()));

                  },
                ),
                _buildMenuItem(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy Policy',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicyScreen()));

                  },
                ),
                _buildMenuItem(
                  icon: Icons.logout,
                  title: 'Log out',
                  onTap: () {},
                  isLogout: true,
                ),

              ],
            ),
          ),

    ));
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isLogout ? Colors.red.shade50 : Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isLogout ? Colors.red : Colors.black,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Lexend',
                  color: isLogout ? Colors.red : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

}
