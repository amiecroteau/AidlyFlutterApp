import 'dart:convert';
import 'package:aidly/views/interests.dart';
import 'package:flutter/material.dart';
import 'package:aidly/models/userModel.dart';
import 'package:aidly/utils/colors.dart';
import 'package:aidly/utils/requests.dart';
import 'package:http/http.dart';
import 'package:aidly/utils/constants.dart';
//import 'package:aidly/sqflite.dart';

//import 'interests.dart';

// ignore: must_be_immutable
class registerThankYouPage extends StatelessWidget {
  UserModel model;

  registerThankYouPage({this.model});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text('Thank You For Your Registration')),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Hi, ${model.firstName}\n\nPlease Verify your Information is correct:\n",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 1),
              Text('First Name:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(model.firstName, style: TextStyle(fontSize: 22)),
              Text('Last Name:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(model.lastName, style: TextStyle(fontSize: 22)),
              Text('Email:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(model.email, style: TextStyle(fontSize: 22)),
              Text('Password:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(model.password, style: TextStyle(fontSize: 22)),
              Text('Zip:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(model.zip, style: TextStyle(fontSize: 22)),
              Text('Phone:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(model.phone, style: TextStyle(fontSize: 22)),
              Text('Days Available:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              showDay(model.day),
              Text('Time Available:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              showTime(model.time),
              Text('Volunteer Statement:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(model.statement, style: TextStyle(fontSize: 22)),
              MaterialButton(
                color: primaryColor,
                onPressed: () {
                  print(this.model.firstName);
                  new Future(()=>null).then((value) => pushData(this.model)).then((value) {
                    print(value);
                    if(value['status'] == 'success') {
                      Constants.prefs.setString('token', value['auth_token']);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  InterestsPage(model: this.model)));
                    } else {
                      showDialog<Null>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            title: new Text('Registration Failed'),
                            content: new SingleChildScrollView(
                              child: new ListBody(
                                children: <Widget>[
                                  new Text('Sorry, your registration failed. Please try again.'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              new FlatButton(
                                child: new Text('Confirm'),
                                onPressed: () {
                                  Navigator.of(context)..pop()..pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
//                    Navigator.pushNamed(
//                      (context),
//                      '/interests',
//                    );
                  });
                },
                child: Center(
                  child: Text(
                    'Click to Continue',
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
    ));
  }

  showDay(int day) {
    if (model.day == 0) {
      var day = Text('Weekends', style: TextStyle(fontSize: 22));
      return day;
    } else {
      var day = Text('Weekdays', style: TextStyle(fontSize: 22));
      return day;
    }
  }

  showTime(int time) {
    if (model.time == 4) {
      var time = Text('Mornings', style: TextStyle(fontSize: 22));
      return time;
    } else if (model.time == 5) {
      var time = Text('Afternoons', style: TextStyle(fontSize: 22));
      return time;
    } else {
      var time = Text('Evenings', style: TextStyle(fontSize: 22));
      return time;
    }
  }

  Future<Map<String, dynamic>> pushData(UserModel model) async {
    Response res = await HttpRequests.postJson("http://165.227.87.42:1234/user/create", json.encode(model.toMap()));
    Map<String, dynamic> resJson = json.decode(res.body);
    return resJson;
  }

}
