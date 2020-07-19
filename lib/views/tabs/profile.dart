import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
import 'package:aidly/utils/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:aidly/models/userModel.dart';
import 'dart:async';

class ProfilePage extends StatefulWidget {
  UserModel model;

  ProfilePage(UserModel model) {
    this.model = model;
  }

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final hr = Divider();

    final userNameLocation = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${widget.model.firstName} ${widget.model.lastName}",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            widget.model.zip,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            widget.model.phone,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            widget.model.email,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            widget.model.statement,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
// TODO: Add the variables to receive the model
    final userInfo = Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(8.0),
            shadowColor: Colors.white,
            child: Container(
              height: 220.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                ),
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[SizedBox(width: 30.0), userNameLocation],
              ),
            ),
          ),
        ),
      ],
    );

    final textButton = RaisedButton(
      onPressed: () async {
        SocialShare.shareSms(
                "Hey, I'm looking to volunteer using Aidly. Would you like to volunteer with me?",
                url: "\nhttps://Aidly.com/")
            .then((data) {
          print(data);
        });
      },
      color: Colors.teal,
      child: Icon(
        Icons.chat,
        color: Colors.white,
      ),
    );

    final secondCard = Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 30.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        shadowColor: Colors.white,
        child: Container(
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: <Widget>[
              _buildIconTile(
                  Icons.check, Colors.red, 'First Match populated here'),
              hr,
              _buildIconTile(
                  LineIcons.check, Colors.green, 'Second Match populated here'),
              hr,
              _buildIconTile(LineIcons.check, Colors.purpleAccent,
                  'Third Match populated here'),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 350.0,
                      ),
                      Container(
                        height: 250.0,
                        decoration: BoxDecoration(gradient: primaryGradient),
                      ),
                      Positioned(top: 100, right: 0, left: 0, child: userInfo)
                    ],
                  ),
                  secondCard,
                  textButton,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserStats(String name, String value) {
    return Column(
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            color: Colors.grey.withOpacity(0.6),
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildIconTile(IconData icon, Color color, String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      trailing: Icon(LineIcons.chevron_circle_right),
    );
  }
}
