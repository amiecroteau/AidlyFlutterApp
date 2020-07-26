import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:aidly/_routing/routes.dart';
import 'package:aidly/utils/colors.dart';
//import 'package:aidly/views/expertise.dart';
//import 'package:aidly/views/tabs/profile.dart';
//import 'package:line_icons/line_icons.dart';
import 'package:aidly/models/userModel.dart';
//import 'package:aidly/views/registerThankYouPage.dart';

import 'package:aidly/views/home.dart';

// ignore: must_be_immutable
class InterestsPage extends StatefulWidget {
  UserModel model;

  InterestsPage({this.model});
  _InterestsPageState createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  UserModel model;
  final List<String> interests = <String>[];
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
        children: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )
        ],
      ),
    );

    final pageTitle = Container(
      child: Text(
        "Hi, ${widget.model.firstName} \nthanks for choosing Aidly.\n"
        "\n"
        "To make the best match,\nlet's find out more about you."
        "\n",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.teal,
          fontSize: 25.0,
        ),
      ),
    );

    final description = Container(
      child: Center(
        child: Text(
          "Please answer these questions with keywords that describe your interests or expertise:\n"
          "\n"
          "What groups are you interested in?\n"
          "\n"
          "What areas interest you?\n"
          "\n"
          "What expertise do you hold?\n"
          "\n"
          "What do you enjoy doing?"
          "\n",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.0,
          ),
        ),
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
        margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
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
      padding: EdgeInsets.only(top: 20.0),
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
              // Setting Interests entered as the interest for the user model
              widget.model.interests = interests;
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(model: widget.model)),
              );
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
                    description,
                    formFieldSpacing,
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
}
