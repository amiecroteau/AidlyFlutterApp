import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:aidly/utils/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:aidly/models/userModel.dart';

class FeedsPage extends StatefulWidget {
  UserModel model;

  FeedsPage(UserModel model) {
    this.model = model;
  }

  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  @override
  Widget build(BuildContext context) {
    final hr = Divider();

    final userNameLocation = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hi ${widget.model.firstName},",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            "\n"
            "Thank you for choosing Aidly."
            "\n"
            "Below are your top 3 matches.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
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
              height: 200.0,
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

    final secondCard = Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
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
    final Title = Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0),
      child: Container(
        child: Text(
          'Not seeing your favorite Non-Profit? \n\Share their information with Aidly.',
          style: TextStyle(
            color: Colors.red.withOpacity(1),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
      ),
    );

    final InputTitle = Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 4.0),
      child: Container(
        child: Container(
          height: 50,
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Non-Profit Name *',
            ),
            onSaved: (String value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
          ),
        ),
      ),
    );

    final InputTitle2 = Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 4.0, top: 0),
      child: Container(
        child: Container(
          height: 50,
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Non-Profit Website *',
            ),
            onSaved: (String value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
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
                      Positioned(top: 120, right: 0, left: 0, child: userInfo)
                    ],
                  ),
                  secondCard,
                  Title,
                  InputTitle,
                  InputTitle2,
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

  Widget _buildSurveyCard(String title, InputElement) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      leading: Container(
        height: 30.0,
        width: 30.0,
      ),
    );
  }
}
