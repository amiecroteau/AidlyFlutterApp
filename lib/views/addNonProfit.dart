import 'package:aidly/utils/colors.dart';
import 'package:aidly/models/nonprofitModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNonProfitPage extends StatefulWidget {
  @override
  _AddNonProfitPageState createState() => _AddNonProfitPageState();
}

class _AddNonProfitPageState extends State<AddNonProfitPage> {
  final model = NonprofitModel();
  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // Change Status Bar Color
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: primaryColor),
    );
    final pageTitle = Text(
          "Not Listed Non-Profit",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
          ),
    );
    final nameField = TextFormField(
      controller: model.name,
      decoration: InputDecoration(
        labelText: 'Non-Profit Name',
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
    );
    final websiteField = TextFormField(
      controller: model.website,
      decoration: InputDecoration(
        labelText: 'Non-Profit Website',
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      keyboardType: TextInputType.url,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
    );
    final submitBtn = Container(
      margin: EdgeInsets.only(top: 40.0),
      height: 60.0,
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: Colors.white),
        color: Colors.white,
      ),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          //
          Navigator.of(context).pop();
        },
        color: Colors.white,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(7.0),
        ),
        child: Text(
          'SUBMIT',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20.0,
          ),
        ),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 150.0, left: 30.0, right: 30.0),
          decoration: BoxDecoration(gradient: primaryGradient),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              pageTitle,
              Container(height: 25,),
              nameField,
              websiteField,
              submitBtn,
            ],
          ),
        ),
      ),
    );
  }
}