import 'package:devhub/utils/colors.dart';
import 'package:devhub/views/dashboard/holiday_list_screen.dart';
import 'package:devhub/views/dashboard/home_screen.dart';
import 'package:devhub/views/dashboard/leaves_screen.dart';
import 'package:devhub/views/dashboard/profile_screen.dart';
import 'package:devhub/views/dashboard/team_members_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.white ,
      body: Stack(
        children: [
          getPages(_currentIndex),
        ],
      ),
      bottomNavigationBar:Material(
        color: Colors.transparent,
        child: Container(
          //color: Colors.white,
          width: size.width,
          height: 80,
          child: Stack(
            children: [
              CustomPaint(
                size: Size(size.width, 80),
                painter: BottomCustomPainter(),
              ),
              Center(
                heightFactor: 0.6,
                child: SizedBox(
                  height: 68,
                  width: 68,
                  child:  FloatingActionButton(onPressed: (){
                    setState(() {
                      _currentIndex=2;
                    });
                  },
                    //elevation: 0.1,
                    backgroundColor: MyColors.primaryBlue,
                    shape: CircleBorder(),
                    child: SvgPicture.asset(
                      height: 30,
                      'assets/svg/profile_user.svg',
                    ),
                  ),),
              ),

            Stack(
              children: [
                Container(
                  width: size.width,
                  height: 80,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      BottomNavButton(icon:'assets/svg/home.svg',
                          index: 0,
                          currentIndex: _currentIndex,
                          onTap: (val){
                            setState(() {
                              _currentIndex=val;
                            });
                          }),
                      BottomNavButton(icon: 'assets/svg/note.svg', index: 1, currentIndex: _currentIndex, onTap: (val){
                        setState(() {
                          _currentIndex=val;
                        });
                      }),
                      SizedBox(width: size.width*0.20,),
                      BottomNavButton(icon:'assets/svg/holiday.svg', index: 3, currentIndex: _currentIndex, onTap: (val){
                        setState(() {
                          _currentIndex=val;
                        });
                      }),
                      BottomNavButton(icon: 'assets/svg/profile.svg', index: 4, currentIndex: _currentIndex, onTap: (val){
                        setState(() {
                          _currentIndex=val;
                        });
                      }),
                    ],
                  ),
                ),

                AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                  curve: Curves.decelerate,
                  left: _currentIndex==0?25:100,
                  child: Container(
                    height: size.height*0.01,
                    width: size.width*0.12,
                    decoration: BoxDecoration(
                      color: MyColors.primaryBlue,
                      borderRadius: BorderRadius.circular(10)
                    ),
                  )
                )
              ],
            )
            ],
          ),
        ),
      ),
    );
  }

  Widget getPages(int position){
    switch(position ){
      case 0:
        return HomeScreen();
      case 1:
        return LeavesScreen();
      case 2:
        return TeamMembersScreen();
      case 3:
        return HolidayListScreen();
      case 4:
        return ProfileScreen();
    }
    return Container();
  }

}

class BottomCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(size.width*0.20, 0, size.width*0.35, 0);
    path.quadraticBezierTo(size.width*0.40, 0, size.width*0.40, 20);
    path.arcToPoint(Offset(size.width*0.60, 20),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width*0.60,0, size.width*0.65, 0);
    path.quadraticBezierTo(size.width*0.80,0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}


class BottomNavButton extends StatelessWidget {
  const BottomNavButton({super.key , required this.icon, required this.index, required this.currentIndex, required this.onTap});
  final int index;
  final int currentIndex;
  final String icon;
  final Function(dynamic) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap(index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child:  SvgPicture.asset(
          height: 30,
          icon,
          color: (currentIndex ==index)? MyColors.primaryBlue: MyColors.primaryBlack,
        ),
      ),
    );
  }

}
