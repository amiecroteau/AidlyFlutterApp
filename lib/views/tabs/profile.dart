import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:aidly/utils/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:aidly/models/userModel.dart';
import 'package:aidly/models/orgModel.dart';

class ProfilePage extends StatefulWidget {
  UserModel model;

  ProfilePage(UserModel model) {
    this.model = model;
  }

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var rating = 3.0;

  Widget build(BuildContext context) {
    final hr = Divider();

    final userNameLocation = Container(
      child: Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${widget.model.firstName} ${widget.model.lastName}",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              widget.model.email,
              style: TextStyle(
                color: Colors.grey.withOpacity(0.6),
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              widget.model.statement,
              style: TextStyle(
                color: Colors.grey.withOpacity(0.6),
                fontSize: 20.0,
              ),
            ),
          ],
        ),
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
              height: 220.0,
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

    final profileTitle = Text("Completed Volunteer Positions:",
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w900,
          fontSize: 20.0,
        ));
    final secondCard = Padding(
      padding:
          EdgeInsets.only(right: 20.0, left: 20.0, bottom: 30.0, top: 20.0),
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
              //TODO: Send value of rating to model to be pulled by database
              _buildIconTile('BBBS of Berks County'),
              hr,
              Text("Rate your volunteer experience:"),
              SmoothStarRating(
                rating: rating,
                isReadOnly: false,
                size: 80,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                defaultIconData: Icons.star_border,
                starCount: 4,
                allowHalfRating: true,
                spacing: 2.0,
                onRated: (value) {
                  print("rating value -> $value");
                },
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
                      Positioned(top: 100, right: 0, left: 0, child: userInfo)
                    ],
                  ),
                  profileTitle,
                  secondCard,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserStats(String name, String value) {
    return Expanded(
      flex: 5,
      child: Column(
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
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconTile(String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        textAlign: TextAlign.justify,
      ),
      leading: Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
