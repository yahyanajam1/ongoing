import 'package:devhub/views/auth/new_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/colors.dart';
import '../../utils/widgets.dart';


class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  final FocusNode _focusNode = FocusNode();

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
                                text: "Enter Verification Code",
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: MyColors.primaryBlack, fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Lexend'),
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
                      child: Text("We have sent the code verification number to your mobile number",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14, color: MyColors.appGrey, fontFamily: 'Lexend'),),
                    ),

                    SvgPicture.asset(
                      height: h*0.5,
                      'assets/svg/verification_pana.svg',
                      fit: BoxFit.contain,
                    ),

                    SizedBox(
                      height: 8,
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20,),
                      child: PinCodeTextField(
                        //controller: codeController,
                        autoFocus: false,
                        focusNode: _focusNode,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          fieldHeight: h*0.096,
                          fieldWidth: w*0.19,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(12),
                          activeColor: MyColors.primaryBlue,
                          inactiveColor: MyColors.appGrey.withOpacity(0.6),
                          selectedColor: MyColors.primaryBlue,
                          disabledColor: MyColors.appGrey,
                        ),
                        keyboardType: TextInputType.number,
                        animationDuration: Duration(milliseconds: 300),
                        onChanged: (value) {

                        },
                        textStyle: TextStyle(
                          fontSize: 24,
                          //fontFamily: "klavika-light",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ), appContext: context,
                      ),
                    ),


                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 20),
                      child:  RichText(
                        text: TextSpan(
                          text: '00:30 ',
                          style: TextStyle(color: MyColors.primaryBlack, fontSize: 16, fontFamily: 'Lexend'),
                          children: [

                            TextSpan(
                              text: 'Resend it',
                              style: TextStyle(color: MyColors.primaryBlue, fontWeight: FontWeight.normal, fontFamily: 'Lexend', fontSize: 16,),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                // Navigate to screen
                                debugPrint('clicked');
                              },
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton:  Container(
            margin: EdgeInsets.only(
              left: 20, right: 20,),
            child:  authFormButton(
                title: "Verify",
                height: h*0.068,
                pressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> NewPasswordScreen()));
                }),
          ),
        ));
  }

}
