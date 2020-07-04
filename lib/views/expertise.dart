import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/_routing/routes.dart';
import 'package:flutter_social/models/model.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/views/tabs/profile.dart';
import 'package:line_icons/line_icons.dart';

import 'home.dart';

class ExpertisePage extends StatefulWidget {
  UserModel model;

  ExpertisePage({this.model});

  @override
  _ExpertisePageState createState() => _ExpertisePageState();
}

class _ExpertisePageState extends State<ExpertisePage> {
  UserModel model;

  final List<String> expertise = <String>[
    'mentoring',
    'computers',
  ];
  TextEditingController expertiseController = TextEditingController();

  void addItemToList() {
    setState(() {
      expertise.insert(0, expertiseController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = Padding(
      padding: EdgeInsets.only(bottom: 40.0),
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
        "Tell what you do well.",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
    );

    final formFieldSpacing = SizedBox(
      height: 20.0,
    );

    final interestIntro = Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: expertiseController,
            decoration: InputDecoration(
              labelText: 'Add your Expertise',
            ),
          ),
        ),
      ],
    );
    final interestButton = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
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
              'ADD EXPERTISE',
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
              itemCount: expertise.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  margin: EdgeInsets.all(2),
                  child: Center(
                    child: Text(
                      '${expertise[index]}',
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
        margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
        height: 60.0,
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(model: this.model)));
              Navigator.pushNamed((context), '/home');
            },
            child: Text(
              'SUBMIT EXPERTISE',
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
                    interestIntro,
                    interestButton,
                    interestLists,
                    formFieldSpacing,
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
