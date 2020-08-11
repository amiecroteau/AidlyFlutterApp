import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:aidly/models/userModel.dart';
//void main() => runApp(MailPage());

class MailPage extends StatefulWidget {
  String DestinationEmail;
  UserModel model;

  MailPage(String dest, UserModel model) {
    this.DestinationEmail = dest;
    this.model = model;
  }

  @override
  _MailPageState createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  List<String> attachments = [];
  bool isHTML = false;

  var _recipientController = TextEditingController();

  final _subjectController =
      TextEditingController(text: 'Aidly Referral: New Volunteer Inquiry');
  var _bodyController = TextEditingController(
      text:
          'Hi, I found your non-profit organization on Aidly.\n I am interested in your open volunteer positions\n');

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _recipientController.text = widget.DestinationEmail;
    _bodyController.text =
        'Hi, my name is ${widget.model.firstName} ${widget.model.lastName} \n \nI found your non-profit organization on Aidly.\nI am interested in your open volunteer positions\n \nI am available during '
        '${showDay(widget.model.day)} in the ${showTime(widget.model.time)}.\n \nPlease reach out to me in response to this email or at ${widget.model.email}.';

    setState(() {});
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Email your selected Non Profit'),
        actions: <Widget>[
          IconButton(
            onPressed: send,
            icon: Icon(Icons.send),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: _recipientController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Recipient',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: _subjectController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Subject',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: _bodyController,
                  maxLines: 10,
                  decoration: InputDecoration(
                      labelText: 'Body', border: OutlineInputBorder()),
                ),
              ),
              ...attachments.map(
                (item) => Text(
                  item,
                  overflow: TextOverflow.fade,
                ),
              ),
              RaisedButton(
                onPressed: send,
                child: Text(
                  'Send Email',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                color: Colors.teal,
              )
            ],
          ),
        ),
      ),
    );
  }

  showDay(int day) {
    if (widget.model.day == 0) {
      return 'weekends';
    } else {
      return 'weekdays';
    }
  }

  showTime(int time) {
    if (widget.model.time == 4) {
      return 'mornings';
    } else if (widget.model.time == 5) {
      return 'afternoons';
    } else {
      return 'evenings';
    }
  }
}
