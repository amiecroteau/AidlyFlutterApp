import 'package:flutter/material.dart';
import 'package:flutter_social/_routing/routes.dart';
import 'package:flutter_social/models/model.dart';
import 'package:flutter_social/views/home.dart';
import 'package:flutter_social/views/tabs/profile.dart';

class registerThankYouPage extends StatelessWidget {
  UserModel model;

  registerThankYouPage({this.model});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text('Successful')),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(model.firstName, style: TextStyle(fontSize: 22)),
            Text(model.lastName, style: TextStyle(fontSize: 22)),
            Text(model.email, style: TextStyle(fontSize: 22)),
            Text(model.password, style: TextStyle(fontSize: 22)),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                              model: this.model,
                            )));
              },
              child: Text(
                'Click to Continue',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
