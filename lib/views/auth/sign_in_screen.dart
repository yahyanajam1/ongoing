import 'package:devhub/utils/colors.dart';
import 'package:devhub/utils/widgets.dart';
import 'package:devhub/views/auth/forgot_password_screen.dart';
import 'package:devhub/views/auth/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool validate = false;

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
            toolbarHeight: 30,
          ),
      extendBodyBehindAppBar: true,
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
                                      text: "Welcome Back 👋 \nto ",
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
                            'Email',
                            emailController,
                            validate),
                        SizedBox(height: 16,),
                        kTextField(
                            'Password',
                            passwordController,
                            validate,SizedBox()),
                        SizedBox(height: 12,),

                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          alignment: Alignment.centerRight ,
                          child:  InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => ForgotPasswordScreen()));
                              },
                              child: Text(
                                ' Forgot password ? ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lexend',
                                    color: MyColors.primaryBlue,
                                    fontSize: 14),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),


                        Container(
                          margin: EdgeInsets.only(
                              left: 20, right: 20,),
                          child:  authFormButton(
                              title: "Login",
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
                  Text("Don't have an account ? ",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14, color: MyColors.primaryBlack, fontFamily: 'Lexend', ),),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                    },
                    child: Text("Register",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14, color: MyColors.primaryBlue, fontWeight: FontWeight.w600, fontFamily: 'Lexend', ),),

                  )

              ],
            ),
          ),
    )


    );
  }



}
