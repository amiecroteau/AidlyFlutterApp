import 'package:aidly/views/login.dart';
import 'package:flutter/material.dart';
import 'package:aidly/views/landing.dart';
import 'package:aidly/_routing/routeNames.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case landingViewRoute:
      return MaterialPageRoute(builder: (context) => LandingPage());
    case loginViewRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());

    default:
      return MaterialPageRoute(builder: (context) => LandingPage());
  }
}
