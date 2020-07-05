import 'package:flutter/material.dart';
import 'package:flutter_social/_routing/routes.dart';
import 'package:flutter_social/_routing/router.dart' as router;
import 'package:flutter_social/theme.dart';
import 'package:flutter_social/views/expertise.dart';
import 'package:flutter_social/views/home.dart';
import 'package:flutter_social/views/interests.dart';
import 'package:flutter_social/views/register.dart';
import 'package:flutter_social/views/registerThankYou.dart';
import 'package:flutter_social/views/tabs/profile.dart';
import 'package:flutter_social/models/model.dart';

class App extends StatelessWidget {
  UserModel model;
  App({this.model});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aidly',
        debugShowCheckedModeBanner: false,
        theme: buildThemeData(),
        onGenerateRoute: router.generateRoute,
        initialRoute: landingViewRoute,
        routes: {
          '/register': (context) => RegisterPage(),
          '/registerThankYou': (context) => registerThankYouPage(),
          '/expertise': (context) => ExpertisePage(),
          '/interests': (context) => InterestsPage(),
          '/profile': (context) => ProfilePage(),
          '/home': (context) => HomePage(),
        });
  }
}
