import 'package:devhub/views/dashboard/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/widgets.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {

  final TextEditingController passwordController = TextEditingController();
  bool validate = false;

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
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [

                Column(
                  children: [


                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                            children:[
                              TextSpan(
                                text: "Enter New Password",
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: MyColors.primaryBlack, fontWeight: FontWeight.w600, fontSize: 26.sp, fontFamily: 'Lexend'),
                              ),
                            ]
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    SizedBox(
                      height: 8,
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.centerLeft,
                      child: Text("Please enter your new password",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14, color: MyColors.appGrey, fontFamily: 'Lexend'),),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: SvgPicture.asset(
                        height: h*0.48,
                        'assets/svg/new_password_pana.svg',
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),

                kTextField(
                    'Enter New Password',
                    passwordController,
                    validate,SizedBox()),
                const SizedBox(height: 16),
                kTextField(
                    'Re-Enter Password',
                    passwordController,
                    validate,SizedBox()),
                SizedBox(
                  height: h*0.12,
                ),

              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton:  Container(
            margin: EdgeInsets.only(
              left: 20, right: 20,),
            child:  authFormButton(
                title: "Update Password",
                height: h*0.068,
                pressed: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => CongratulationsDialog(),
                  );
                }),
          ),
        ));
  }
}


class CongratulationsDialog extends StatelessWidget {
  const CongratulationsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Illustration
            Align(
              alignment: Alignment.center,
              child:  SvgPicture.asset(
                height: h*0.3,
                'assets/svg/successful_pana.svg',
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(height: 12),

            // Title with Emoji
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Congratulations ",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primaryBlue,
                      fontFamily: 'Lexend'
                    ),
                  ),
                  TextSpan(
                    text: "🎉",
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 4),

            // Subtitle
            Text(
              "Your account is ready to use",
              style: TextStyle(
                fontSize: 14,
                color: MyColors.primaryBlack,
                fontFamily: 'Lexend'
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),


            authFormButton(
                title: "Back to Home",
                height: h*0.06,
                pressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                })
          ],
        ),
      ),
    );
  }
}
