import 'package:aidly/models/orgModel.dart';
import 'package:flutter/material.dart';
import 'package:aidly/models/userModel.dart';
import 'package:aidly/utils/colors.dart';
//import 'package:aidly/utils/constants.dart';
import 'package:line_icons/line_icons.dart';
import 'package:aidly/views/tabs/calendar.dart';
import 'package:aidly/views/tabs/matches.dart';
import 'package:aidly/views/tabs/profile.dart';
import 'package:aidly/views/tabs/mail.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  UserModel model;
  OrgModel orgsList;

  HomePage({this.model, this.orgsList});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  UserModel model;
  List<OrgModel> orgsList;
  List<Widget> _pages;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _pages = [
      FeedsPage(widget.model),
      MailPage(),
      CalendarScreen(),
      ProfilePage(widget.model),
    ];

    final bottomNavBar = BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey.withOpacity(0.6),
      elevation: 0.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.check),
          title: Text(
            'Matches',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          title: Text(
            'Email',
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
