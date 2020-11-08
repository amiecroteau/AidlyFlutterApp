import 'package:aidly/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:aidly/theme.dart';
import 'package:aidly/_routing/routes.dart' as router;
import 'package:aidly/_routing/routeNames.dart';
import 'package:aidly/views/home.dart';
import 'package:aidly/models/userModel.dart';

import 'views/landing.dart';

class App extends StatelessWidget {
  // UserModel model;
  App();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aidly',
        debugShowCheckedModeBanner: false,
        theme: buildThemeData(),
        onGenerateRoute: router.generateRoute,
        initialRoute: getStartingRoute(),
        routes: {
          '/': (context) => LandingPage(),
          // '/register': (context) => RegisterPage(),
          // '/registerThankYou': (context) => registerThankYouPage(),
          // '/expertise': (context) => ExpertisePage(),
          // '/interests': (context) => InterestsPage(),
          // '/profile': (context) => ProfilePage(),
          '/home': (context) => HomePage(model: new UserModel(
              firstName: Constants.prefs.getString('firstName'),
              lastName: Constants.prefs.getString('lastName'),
              email: Constants.prefs.getString('email'),
          )),
        });
  }

  String getStartingRoute() {
    // TODO: if user is logged in, return homepage, else, Landing Page
    return Constants.prefs.getBool("logged")==true ? homeViewRoute : landingViewRoute;
  }
}
