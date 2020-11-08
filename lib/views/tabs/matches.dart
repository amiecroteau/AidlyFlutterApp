import 'package:aidly/models/orgModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:aidly/utils/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:aidly/models/userModel.dart';
import 'package:aidly/utils/requests.dart';
import 'package:aidly/utils/constants.dart';
import 'package:aidly/views/addNonProfit.dart';
import 'package:aidly/views/orgProfile.dart';

import 'mail.dart';

class FeedsPage extends StatefulWidget {
  Future<List<OrgModel>> orgsList;
  UserModel model;

  FeedsPage(UserModel model) {
    this.orgsList =
        HttpRequests.organization(Constants.prefs.getString("token"));
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
          height: 480.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: FutureBuilder<List<OrgModel>>(
            future: widget.orgsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                for (int x = 0; x < snapshot.data.length; x++) {}
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    OrgModel org = snapshot.data[index];
                    return Column(
                      children: <Widget>[
                        _buildIconTile(
                            LineIcons.check,
                            Colors.red, org),
                        hr,
                      ],
                    );
                  },
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );

    final Title = Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0),
      child: Container(
//        child: Text(
//          //TODO: Create a new model for these non-Profits and send this value to it. Need Submission button
//          'Not seeing your favorite Non-Profit?\n'
//          'Share their information with Aidly.',
//          style: TextStyle(
//            color: Colors.red.withOpacity(1),
//            fontStyle: FontStyle.italic,
//            fontWeight: FontWeight.w600,
//            fontSize: 16.0,
//          ),
//        ),
        child: RichText(
          text: TextSpan(
            text: 'Not seeing your favorite Non-Profit?\n',
            style: TextStyle(
              color: Colors.red.withOpacity(1),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
            children: <TextSpan> [
              TextSpan(
                text: 'Share their information',
                style: TextStyle(
                  color: Colors.red.withOpacity(1),
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context) => AddNonProfitPage()));
                  },
              ),
              TextSpan(
                text: ' with Aidly!',
                style: TextStyle(
                  color: Colors.red.withOpacity(1),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ],
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
                  Container(height: 12,),
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

  Widget _buildIconTile(
      IconData icon,
      Color color,
      OrgModel org) {
    return ListTile(
      title: Text(
        org.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Align(
        alignment: Alignment.centerLeft,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Email: ' + org.main_email),
              Text('Street Address: ' + org.street),
              Text('City: ' + org.city),
              Text('State: ' + org.state),
              Text('Zip: ' + org.zip),
              Text('Phone: ' + org.phone),
              Text('Match: ${org.percentage_match}',
                  style: TextStyle(fontWeight: FontWeight.bold))
            ]),
      ),
      leading: Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      trailing: Icon(LineIcons.chevron_circle_right),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrgProfile(org, widget.model),
        ),
      ),
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
