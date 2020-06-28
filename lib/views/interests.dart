import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/_routing/routes.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:line_icons/line_icons.dart';

class InterestsPage extends StatefulWidget {
  @override
  _InterestsPageState createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  final List<String> interests = <String>[
    'teaching',
    'cooking',
  ];
  TextEditingController interestsController = TextEditingController();

  void addItemToList() {
    setState(() {
      interests.insert(0, interestsController.text);
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
        "Tell what you like to do.",
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
            controller: interestsController,
            decoration: InputDecoration(
              labelText: 'Add your Interest',
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
              'ADD INTERESTS',
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
            onPressed: () =>
                Navigator.of(context).pushNamed(expertiseViewRoute),
            child: Text(
              'SUBMIT INTERESTS',
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
