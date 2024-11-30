import 'package:flutter/material.dart';
import 'package:fp_tekber/screens/home_screen.dart';
import 'package:fp_tekber/screens/pickup_screens.dart';
import 'package:fp_tekber/screens/user_settings.dart';
import 'package:fp_tekber/screens/landing-page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/ajukan-pickup': (context) => const PickupPage(),
  '/profil-saya': (context) => const UserSettings(),
  '/login': (context) => const LoginSignup(),
};
