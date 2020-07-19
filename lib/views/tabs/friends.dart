import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';

//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    final IntroBlock = Padding(
      padding: EdgeInsets.only(top: 1.0, bottom: 30.0, left: 20.0, right: 20.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          "Invite others to join Aidly and Volunteer!\n"
          "Share your experiences with friends",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
            fontSize: 15.0,
          ),
        ),
      ),
    );
    final textButton = RaisedButton(
      onPressed: () async {
        SocialShare.shareSms("Come volunteer with me! Join Aidly",
                url: "\nhttps://aidly.com/", trailingText: "\nhello")
            .then((data) {
          print(data);
        });
      },
      color: Colors.teal,
      child: Icon(
        Icons.chat,
        color: Colors.white,
      ),
    );
    final twitterButton = RaisedButton(
      onPressed: () async {
        SocialShare.shareTwitter("Come volunteer with me! Join Aidly",
                hashtags: [
                  "Volunteer",
                  "GIVEBACK",
                ],
                url: "https://aidly.com/#/hello",
                trailingText: "\nhello")
            .then((data) {
          print(data);
        });
      },
      color: Colors.teal,
      child: Icon(
        LineIcons.twitter,
        color: Colors.white,
      ),
    );
    final instagramButton = RaisedButton(
      onPressed: () async {
        File file = await ImagePicker.pickImage(source: ImageSource.gallery);
        SocialShare.shareInstagramStory(
                file.path, "#ffffff", "#000000", "https://deep-link-url")
            .then((data) {
          print(data);
        });
      },
      color: Colors.teal,
      child: Icon(
        LineIcons.instagram,
        color: Colors.white,
      ),
    );

    final facebookButton = RaisedButton(
      onPressed: () async {
        await screenshotController.capture().then((image) async {
          //facebook appId is mandatory for andorid or else share won't work
          Platform.isAndroid
              ? SocialShare.shareFacebookStory(
                      image.path, "#ffffff", "#000000", "https://google.com",
                      appId: "722527851869867")
                  .then((data) {
                  print(data);
                })
              : SocialShare.shareFacebookStory(
                      image.path, "#ffffff", "#000000", "https://google.com")
                  .then((data) {
                  print(data);
                });
        });
      },
      color: Colors.teal,
      child: Icon(
        LineIcons.facebook,
        color: Colors.white,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Invite Friends')),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.withOpacity(0.1),
          padding: EdgeInsets.only(top: 40.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IntroBlock,
              Row(
                children: <Widget>[
                  textButton,
                  twitterButton,
                  instagramButton,
                  facebookButton,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
