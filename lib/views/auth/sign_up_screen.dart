import 'package:devhub/views/auth/sign_in_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/widgets.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool validate = false;
  bool _isChecked = true; // Variable to keep track of checkbox state


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            toolbarHeight: 0,
          ),
          extendBodyBehindAppBar: false,
          body: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only( top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 4),
                                child: Image.asset("assets/images/logo.png"),
                              ),

                              SizedBox(height: 20,),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                      children:[
                                        TextSpan(
                                          text: "Register Account \nto ",
                                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: MyColors.primaryBlack, fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Lexend'),
                                        ),
                                        TextSpan(
                                          text: "HR Attendee",
                                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: MyColors.primaryBlue, fontWeight: FontWeight.w600, fontSize:   28, fontFamily: 'Lexend'),
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

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Hello there, login to continue",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14, color: MyColors.appGrey, fontFamily: 'Lexend'),),
                              ),


                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),


                        Column(
                          children: [

                            kTextField(
                                'First Name',
                                emailController,
                                validate),
                            SizedBox(height: 16,),
                            kTextField(
                                'Last Name',
                                passwordController,
                                validate,SizedBox()),
                            SizedBox(height: 16,),

                            kTextField(
                                'Email Address',
                                passwordController,
                                validate,SizedBox()),

                            SizedBox(height: 16,),

                            kTextField(
                                'Password',
                                passwordController,
                                validate,SizedBox()),

                            SizedBox(height: 16,),

                            kTextField(
                                'Confirm Password',
                                passwordController,
                                validate,SizedBox()),

                            SizedBox(height: 12,),

                            Container(
                              margin: EdgeInsets.only(
                                  left: 12, right: 12),
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: _isChecked,
                                        activeColor: MyColors.primaryBlue, // Color when checked
                                        checkColor: Colors.white,  // Checkmark color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4)
                                        ),
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _isChecked = value ?? false; // Update the state
                                          });
                                        },
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'I agree to the ',
                                          style: TextStyle(color: MyColors.primaryBlack, fontSize: 14, fontFamily: 'Lexend'),
                                          children: [
                                            TextSpan(
                                              text: 'Terms & Conditions & Privacy\nPolicy',
                                              style: TextStyle(color: MyColors.primaryBlue, fontWeight: FontWeight.normal, fontFamily: 'Lexend', fontSize: 14),
                                              recognizer: TapGestureRecognizer()..onTap = () {
                                                // Navigate to Terms & Conditions screen
                                                debugPrint('Terms & Conditions clicked');
                                              },
                                            ),

                                            TextSpan(
                                              text: ' set out by this site.',
                                              style: TextStyle(color: MyColors.primaryBlack, fontSize: 14, fontFamily: 'Lexend'),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 16,),
                            Container(
                              margin: EdgeInsets.only(
                                left: 20, right: 20,),
                              child:  authFormButton(
                                  title: "Register",
                                  height: h*0.068,
                                  pressed: (){

                                  }),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              alignment: Alignment.center,
                              child: InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(
                                    //     builder: (context) => GuestSignIn()));
                                  },
                                  child: Text(
                                    " Or continue with social account ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Lexend',
                                        color: MyColors.appGrey,
                                        fontSize: 14),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),


                            Container(
                              margin: EdgeInsets.only( left: 20, right: 20),
                              child: authSocialButton(
                                height: h*0.068,
                                title: "Google",
                                textColor: MyColors.primaryBlack,
                                color: Colors.white,
                                pressed: (){

                                },
                                widget: SvgPicture.asset(
                                  height: 24,
                                  'assets/svg/google.svg',
                                ),
                              ),
                            ),
                            SizedBox(height: 14,),

                          ],
                        )




                      ],
                    ),
                  ),
                ),
              )),
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ? ",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14, color: MyColors.primaryBlack, fontFamily: 'Lexend', ),),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
                  },
                  child: Text("Login",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14, color: MyColors.primaryBlue, fontWeight: FontWeight.w600, fontFamily: 'Lexend', ),),

                )

              ],
            ),
          ),
        )


    );
  }
}
