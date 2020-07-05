import 'package:flutter/material.dart';
import 'package:flutter_social/models/model.dart';
import 'package:flutter_social/models/user.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/views/tabs/calendar.dart';
import 'package:flutter_social/views/tabs/chats.dart';
import 'package:flutter_social/views/tabs/feeds.dart';
import 'package:flutter_social/views/tabs/notifications.dart';
import 'package:flutter_social/views/tabs/profile.dart';
import 'package:line_icons/line_icons.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  UserModel model;

  HomePage({this.model});
  @override
  _HomePageState createState() => _HomePageState();
}

// ignore: must_be_immutable

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  UserModel model;

  final List<Widget> _pages = [
    FeedsPage(),
    ChatsPage(),
    NotificationsPage(),
    CalendarScreen(),
    ProfilePage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavBar = BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey.withOpacity(0.6),
      elevation: 0.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.rss_feed),
          title: Text(
            'Feed',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.comments),
          title: Text(
            'Chats',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.bell),
          title: Text(
            'Notifications',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.calendar),
          title: Text(
            'Calendar',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.user),
          title: Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );

    return Scaffold(
      bottomNavigationBar: bottomNavBar,
      body: _pages[_currentIndex],
    );
  }
}
