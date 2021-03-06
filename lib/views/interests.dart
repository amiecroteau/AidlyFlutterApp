import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:aidly/_routing/routes.dart';
import 'package:aidly/utils/colors.dart';
//import 'package:aidly/views/expertise.dart';
//import 'package:aidly/views/tabs/profile.dart';
//import 'package:line_icons/line_icons.dart';
import 'package:aidly/models/userModel.dart';
//import 'package:aidly/views/registerThankYouPage.dart';
import 'package:aidly/utils/requests.dart';
import 'package:aidly/views/home.dart';
import 'package:aidly/utils/constants.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

// ignore: must_be_immutable
class InterestsPage extends StatefulWidget {
  UserModel model;

  InterestsPage({this.model});
  _InterestsPageState createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  UserModel model;
  List<String> interests = <String>[];
  TextEditingController interestsController = TextEditingController();

  void addItemToList() {
    setState(() {
      interests.insert(0, interestsController.text);
    });
  }

  Widget build(BuildContext context) {
    final appBar = Padding(
      padding: EdgeInsets.only(bottom: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[],
      ),
    );

    final pageTitle = Container(
      child: Text(
        "Hi, ${widget.model.firstName} \n",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.teal,
          fontSize: 25.0,
        ),
      ),
    );
    final divider = Divider(
      color: Colors.tealAccent,
      height: 20,
      thickness: 2,
      indent: 20,
      endIndent: 0,
    );
    final description = Container(
      child: Column(
        children: <Widget>[
          Text(
            "Please answer these questions with keywords that describe your interests or expertise:\n"
            "\n"
            "What groups are you interested in?\n"
            "What areas interest you?\n"
            "What expertise do you hold?\n"
            "What do you enjoy doing?\n"
            "What causes inspire you?\n",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.teal,
              fontSize: 17.0,
            ),
          ),
          IconButton(
            icon: Icon(Icons.help_outline),
            tooltip: 'More Information',
            color: Colors.teal,
            onPressed: () {
              setState(() {
                showDialog<Null>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return new AlertDialog(
                      title: new Text('More Information'),
                      content: new Text(
                          'You may enter multiple answers to each question, '
                          'but please enter one keyword at a time. '
                          'These keywords will be used to find the most '
                          'relative opportunities for you.'),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text('Confirm'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              });
            },
          ),
        ],
      ),
    );

//TODO: Add a tooltip to show examples.
    final formFieldSpacing = SizedBox(
      height: 10.0,
    );

    final interestIntro = Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: interestsController,
            decoration: InputDecoration(
              labelText: 'Add your Keyword',
            ),
          ),
        ),
      ],
    );
    final interestButton = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Container(
        margin: EdgeInsets.only(top: 0.0, bottom: 5.0),
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: primaryColor),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(7.0),
          color: Colors.white,
          elevation: 10.0,
          shadowColor: Colors.white70,
          child: MaterialButton(
            onPressed: () {
              addItemToList();
            },
            child: Text(
              'ADD KEYWORD',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.0,
                color: primaryColor,
              ),
            ),
          ),
        ),
      ),
    );

    final interestLists = Row(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: interests.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  margin: EdgeInsets.all(2),
                  child: Center(
                    child: Text(
                      '${interests[index]}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );
              }),
        ),
      ],
    );

    final submitBtn = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Container(
        margin: EdgeInsets.only(top: 0.0, bottom: 10.0),
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.white),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(7.0),
          color: primaryColor,
          elevation: 10.0,
          shadowColor: Colors.white70,
          child: MaterialButton(
            color: primaryColor,
            onPressed: () {
              widget.model.interests = interests;
              Future.sync(() => pushInterest(Constants.prefs.getString('token'))).then((value) {
                if(value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(model: widget.model)),
                  );
                } else {
                  showDialog<Null>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return new AlertDialog(
                        title: new Text('Error'),
                        content: new SingleChildScrollView(
                          child: new ListBody(
                            children: <Widget>[
                              new Text(
                                  'Sorry, unable to reach the server, please try again later.'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text('Confirm'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              });
            },
            child: Text(
              'SUBMIT',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Share Your Interests')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: <Widget>[
              appBar,
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    pageTitle,
                    divider,
                    description,
                    divider,
                    interestIntro,
                    interestButton,
                    interestLists,
                    submitBtn
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> pushInterest(String token) async {
    Map<String, List<String>> interestsJson = {'interests': interests};
    Response res = await HttpRequests.postJsonAuthenticated("http://165.227.87.42:1234/user/interest", json.encode(interestsJson), token);
    return (res.statusCode == 200);
  }

}
