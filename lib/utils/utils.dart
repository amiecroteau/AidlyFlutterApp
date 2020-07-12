import 'package:flutter/material.dart';

class AppConfig {
  static const appName = "Aidly";
  static const appTagline = "Make an impact";
}

class AvailableFonts {
  static const primaryFont = "Quicksand";
}

class AvailableImages {
  static const postBanner = {
    'assetImage': AssetImage('assets/images/post_banner.jpg'),
    'assetPath': 'assets/images/post_banner.jpg',
  };

  static const emptyState = {
    'assetImage': AssetImage('assets/images/empty.png'),
    'assetPath': 'assets/images/empty.png',
  };

  static const homePage = const AssetImage('assets/images/home_page.png');
  static const appLogo = const AssetImage('assets/images/logo.png');
}
