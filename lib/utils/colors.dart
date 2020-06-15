import 'package:flutter/material.dart';
import 'dart:ui';

const primaryColor = const Color(0xFF009688);
const primaryLight = const Color(0xFFB2DFDB);
const primaryDark = const Color(0xFF004D40);

const secondaryColor = const Color(0xFF64FFDA);
const secondaryLight = const Color(0xFF80CBC4);
const secondaryDark = const Color(0xFF009688);

const Color gradientStart = const Color(0xFF64FFDA);
const Color gradientEnd = const Color(0xFF004D40);

const primaryGradient = const LinearGradient(
  colors: const [gradientStart, gradientEnd],
  stops: const [0.0, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const chatBubbleGradient = const LinearGradient(
  colors: const [Color(0xFF64FFDA), Color(0xFF004D40)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);

const chatBubbleGradient2 = const LinearGradient(
  colors: const [Color(0xFFB2DFDB), Color(0xFFB2DFDB)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);
