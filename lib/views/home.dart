import 'package:flutter/material.dart';
import 'package:aidly/models/userModel.dart';
import 'package:aidly/utils/colors.dart';
import 'package:aidly/utils/constants.dart';
import 'package:line_icons/line_icons.dart';

import 'package:aidly/views/tabs/feed.dart';
import 'package:aidly/views/tabs/profile.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  UserModel model;

  HomePage({this.model});
  @override
  _HomePageState createState() => _HomePageState(model);
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  UserModel model;

  List<Widget> _pages;

  _HomePageState(UserModel model) {
    this.model = model;
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _pages = [
      FeedsPage(),
      FeedsPage(),
      FeedsPage(),
      FeedsPage(),
      // ChatsPage(),
      // NotificationsPage(),
      // CalendarScreen(),
      ProfilePage(model),
    ];

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
