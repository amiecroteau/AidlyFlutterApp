import 'package:aidly/views/expertise.dart';
import 'package:aidly/views/interests.dart';
import 'package:aidly/views/login.dart';
import 'package:aidly/views/registerThankYouPage.dart';
import 'package:flutter/material.dart';
import 'package:aidly/views/landing.dart';
import 'package:aidly/_routing/routeNames.dart';
import 'package:aidly/views/register.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case landingViewRoute:
      return MaterialPageRoute(builder: (context) => LandingPage());
    case loginViewRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case registerViewRoute:
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case registerThankYouViewRoute:
      return MaterialPageRoute(builder: (context) => registerThankYouPage());
    case interestsViewRoute:
      return MaterialPageRoute(builder: (context) => InterestsPage());
    case expertiseViewRoute:
      return MaterialPageRoute(builder: (context) => ExpertisePage());

    default:
      return MaterialPageRoute(builder: (context) => LandingPage());
  }
}
