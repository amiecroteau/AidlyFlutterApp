import 'package:flutter/material.dart';
import 'package:aidly/views/landing.dart';
import 'package:aidly/_routing/routeNames.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case landingViewRoute:
      return MaterialPageRoute(builder: (context) => LandingPage());

    default:
      return MaterialPageRoute(builder: (context) => LandingPage());
  }
}
