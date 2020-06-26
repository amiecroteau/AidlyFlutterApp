import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/_routing/routes.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:line_icons/line_icons.dart';

class BioPage extends StatefulWidget {
  @override
  _BioPageState createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {
  final _formKey = GlobalKey<FormState>();
  int _dayRadioBtnVal = -1;
  int _timeRadioBtnVal = -1;

  void _handleDayChange(int value) {
    setState(() {
      _dayRadioBtnVal = value;
    });
  }

  void _handleTimeChange(int value) {
    setState(() {
      _timeRadioBtnVal = value;
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
        "Tell us your why to volunteer.",
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

    final bioForm = Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildFormField(
                'Write a sentence explaining who you are.', LineIcons.user),
            formFieldSpacing
          ],
        ),
      ),
    );

    final daysT = Padding(
      padding: EdgeInsets.only(top: 0.0),
      child: Row(
        children: <Widget>[
          Text("When would you like to volunteer?"),
        ],
      ),
    );

    final days = Padding(
      padding: EdgeInsets.only(top: 0.0),
      child: Row(
        children: <Widget>[
          Radio(
            value: 0,
            groupValue: _dayRadioBtnVal,
            onChanged: _handleDayChange,
          ),
          Text("Weekends"),
          Radio(
            value: 1,
            groupValue: _dayRadioBtnVal,
            onChanged: _handleDayChange,
          ),
          Text("Weekdays"),
        ],
      ),
    );
    final timesT = Padding(
      padding: EdgeInsets.only(top: 0.0),
      child: Row(
        children: <Widget>[
          Text("What time during the week would be best for you?"),
        ],
      ),
    );

    final times = Padding(
      padding: EdgeInsets.only(top: 0.0),
      child: Row(
        children: <Widget>[
          Radio(
            value: 4,
            groupValue: _timeRadioBtnVal,
            onChanged: _handleTimeChange,
          ),
          Text("Mornings"),
          Radio(
            value: 5,
            groupValue: _timeRadioBtnVal,
            onChanged: _handleTimeChange,
          ),
          Text("Evenings"),
          Radio(
            value: 6,
            groupValue: _timeRadioBtnVal,
            onChanged: _handleTimeChange,
          ),
          Text("Afternoons"),
        ],
      ),
    );

    final submitBtn = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
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
            onPressed: () =>
                Navigator.of(context).pushNamed(interestsViewRoute),
            child: Text(
              'CREATE ACCOUNT',
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
                    bioForm,
                    formFieldSpacing,
                    daysT,
                    days,
                    formFieldSpacing,
                    timesT,
                    times,
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

  Widget _buildFormField(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          icon,
          color: Colors.black38,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
    );
  }
}
