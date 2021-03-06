import 'package:aidly/views/registerThankYouPage.dart';
import 'package:flutter/material.dart';
import 'package:aidly/models/userModel.dart';
import 'package:aidly/utils/colors.dart';
//import 'package:aidly/views/registerThankYou.dart';
import 'package:line_icons/line_icons.dart';
import 'package:validators/validators.dart' as validator;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  UserModel model = UserModel();
  int _dayRadioBtnVal = -1;
  int _timeRadioBtnVal = -1;

  void _handleDayChange(int value) {
    setState(() {
      _dayRadioBtnVal = value;
      model.day = value;
    });
  }

  void _handleTimeChange(int value) {
    setState(() {
      _timeRadioBtnVal = value;
      model.time = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[],
      ),
    );

//TODO figure out how to test the model object data
    final formFieldSpacing = SizedBox(
      height: 0,
    );

    final registerForm = Padding(
      padding: EdgeInsets.only(top: 0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildFormField(
              'First Name',
              LineIcons.user,
              onSaved: (String value) {
                model.firstName = value;
              },
              textInput: TextInputType.text,
            ),
            _buildFormField(
              'Last Name',
              LineIcons.user,
              onSaved: (String value) {
                model.lastName = value;
              },
              textInput: TextInputType.text,
            ),
            _buildFormField(
              'Email',
              LineIcons.envelope,
              validator: (String value) {
                value = value.trim();
                if (!validator.isEmail(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onSaved: (String value) {
                model.email = value;
              },
              textInput: TextInputType.emailAddress,
            ),
            _buildFormField(
              'Phone Number',
              LineIcons.mobile_phone,
              validator: (String value) {
                if (value.length < 10) {
                  return 'Phone Number should be a minimum of 10 characters';
                }

                _formKey.currentState.save();

                return null;
              },
              onSaved: (String value) {
                model.phone = value;
              },
              textInput: TextInputType.phone,
            ),
            _buildFormField(
              'Zip Code',
              LineIcons.home,
              hintText: 'Zip',
              validator: (String value) {
                if (value.length < 5) {
                  return 'Zip code should be a minimum of 5 characters';
                }

                return null;
              },
              onSaved: (String value) {
                model.zip = value;
              },
              textInput: TextInputType.number,
            ),
            _buildFormField(
              'Password',
              LineIcons.lock,
              isPassword: true,
              hintText: 'Password',
              validator: (String value) {
                if (value.length < 7) {
                  return 'Password should be minimum 7 characters';
                }

                _formKey.currentState.save();

                return null;
              },
              onSaved: (String value) {
                model.password = value;
              },
            ),
            _buildFormField(
              'Confirm Password',
              LineIcons.unlock,
              isPassword: true,
              validator: (String value) {
                // if (model.password != null && value != model.password) {

                // }
                return null;
              },
            ),
            _buildFormField('Why are you volunteering?', LineIcons.user,
                onSaved: (String value) {
              model.statement = value;
            }),
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
      padding: EdgeInsets.only(top: 0.0),
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
              child: Text(
                'CREATE ACCOUNT',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  // print('button pressed');
                  // print(this.model.firstName);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              registerThankYouPage(model: this.model)));
                }
              }),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Share About You')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 0.0),
          child: Column(
            children: <Widget>[
              appBar,
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    registerForm,
                    daysT,
                    days,
                    timesT,
                    times,
                    submitBtn,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, IconData icon,
      {Null Function(String value) onSaved,
      String Function(String value) validator,
      String hintText,
      bool isPassword = false,
      Color iconColor = Colors.black38,
      bool isEmail = true,
      TextInputType textInput = TextInputType.text}) {
    return FormValidator(
      hintText: hintText,
      validator: validator,
      onSaved: onSaved,
      label: label,
      icon: icon,
      iconColor: iconColor,
      isPassword: isPassword,
      isEmail: isEmail,
      textInput: textInput,
    );
  }
}

class FormValidator extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
  final String label;
  final IconData icon;
  final Color iconColor;
  final TextInputType textInput;

  FormValidator({
    this.hintText,
    this.validator,
    this.onSaved,
    this.label,
    this.icon,
    this.iconColor,
    this.isPassword = false,
    this.isEmail = false,
    this.textInput = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
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
        obscureText: isPassword,
        keyboardType: textInput,
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
