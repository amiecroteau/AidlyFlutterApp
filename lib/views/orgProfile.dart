import 'dart:convert';
import 'package:aidly/models/orgModel.dart';
import 'package:aidly/views/interests.dart';
import 'package:flutter/material.dart';
import 'package:aidly/models/userModel.dart';
import 'package:aidly/utils/colors.dart';
import 'package:aidly/utils/requests.dart';
import 'package:http/http.dart';
import 'package:aidly/utils/constants.dart';
import 'package:aidly/views/tabs/mail.dart';
import 'package:flutter/gestures.dart';
//import 'package:aidly/sqflite.dart';


// ignore: must_be_immutable
class OrgProfile extends StatelessWidget {
  OrgModel model;
  UserModel usr;

  OrgProfile(OrgModel org, UserModel usr) {
    this.model = org;
    this.usr = usr;
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text(model.name)),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Organization Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 1),
                Text('Main Email:',
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text(model.main_email, style: TextStyle(fontSize: 22)),
                Text('Street Address:',
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text(model.street, style: TextStyle(fontSize: 22)),
                Text('City:',
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text(model.city, style: TextStyle(fontSize: 22)),
                Text('State:',
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text(model.state, style: TextStyle(fontSize: 22)),
                Text('Zip code:',
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text(model.zip, style: TextStyle(fontSize: 22)),
                Text('Phone:',
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text(model.phone, style: TextStyle(fontSize: 22)),
                Text('Match Percentage:',
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text('${model.percentage_match}', style: TextStyle(fontSize: 22)),
                MaterialButton(
                  color: primaryColor,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MailPage(model.main_email, usr),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Click to Send an Email',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

}
