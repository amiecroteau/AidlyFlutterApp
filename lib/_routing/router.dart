import 'package:flutter/material.dart';
import 'package:flutter_social/_routing/routes.dart';
import 'package:flutter_social/views/chat_details.dart';
import 'package:flutter_social/views/home.dart';
import 'package:flutter_social/views/landing.dart';
import 'package:flutter_social/views/login.dart';
import 'package:flutter_social/views/register.dart';
import 'package:flutter_social/views/reset_password.dart';
import 'package:flutter_social/views/user_details.dart';
import 'package:flutter_social/views/bio.dart';
import 'package:flutter_social/views/expertise.dart';
import 'package:flutter_social/views/interests.dart';
import 'package:flutter_social/views/registerThankYou.dart';
import 'package:flutter_social/views/tabs/profile.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case landingViewRoute:
      return MaterialPageRoute(builder: (context) => LandingPage());
    case homeViewRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case profileViewRoute:
      return MaterialPageRoute(builder: (context) => ProfilePage());
    case loginViewRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case registerViewRoute:
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case bioViewRoute:
      return MaterialPageRoute(builder: (context) => BioPage());
    case interestsViewRoute:
      return MaterialPageRoute(builder: (context) => InterestsPage());
    case expertiseViewRoute:
      return MaterialPageRoute(builder: (context) => ExpertisePage());
    case resetPasswordViewRoute:
      return MaterialPageRoute(builder: (context) => ResetPasswordPage());
    case thankYouViewRoute:
      return MaterialPageRoute(builder: (context) => registerThankYouPage());
    case chatDetailsViewRoute:
      return MaterialPageRoute(
          builder: (context) => ChatDetailsPage(userId: settings.arguments));
    case userDetailsViewRoute:
      return MaterialPageRoute(
          builder: (context) => UserDetailsPage(userId: settings.arguments));
      break;
    default:
      return MaterialPageRoute(builder: (context) => LandingPage());
  }
}
