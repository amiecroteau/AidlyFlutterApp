import 'package:aidly/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aidly/app.dart';
// import 'package:aidly/_routing/routes.dart';
import 'package:aidly/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: primaryDark));
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(App());
}
