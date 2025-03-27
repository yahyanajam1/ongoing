import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {


  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'You update your profile picture',
      'description': 'You just update your profile picture.',
      'time': 'Just Now',
      'icon': CupertinoIcons.person,
    },
    {
      'title': 'Password Changed',
      'description': 'You’ve completed change the password.',
      'time': 'April 12, 2023 at 22:22 PM',
      'icon': CupertinoIcons.lock,
    },
    {
      'title': 'Mark Alen Applied for Leave',
      'description': 'Please accept my leave request.',
      'time': 'February 23, 2022 at 21:22 PM',
      'image': 'assets/images/harry.png', // Provide your image path
    },
    {
      'title': 'System Update',
      'description': 'Please update to the newest app for an amazing experience.',
      'time': 'April 15, 2023 at 21:22 PM',
      'icon': CupertinoIcons.device_phone_portrait,
    },
    {
      'title': 'You update your profile picture',
      'description': 'You just update your profile picture.',
      'time': 'Just Now',
      'icon': CupertinoIcons.person,
    },
    {
      'title': 'Password Changed',
      'description': 'You’ve completed change the password.',
      'time': 'April 12, 2023 at 22:22 PM',
      'icon': CupertinoIcons.lock,
    },
  ];


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios, color: MyColors.primaryBlack,)),
            title:  Text("Notification",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Lexend')),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(child:
              ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),

                    child: ListTile(
                      leading: notification['image'] != null
                          ? CircleAvatar(
                        backgroundImage: AssetImage(notification['image']),
                      )
                          : CircleAvatar(
                        backgroundColor: MyColors.primaryBlue.withOpacity(0.1),
                        child: Icon(notification['icon'], color: Colors.blue),
                      ),
                      title: Text(
                        notification['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Lexend'),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notification['description']!, style: TextStyle(fontFamily: 'Lexend'),),
                          const SizedBox(height: 4),
                          Text(
                            notification['time']!,
                            style: const TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'Lexend'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),)
            ],
          ),
    ));
  }
}
