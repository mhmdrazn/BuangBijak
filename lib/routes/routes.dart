import 'package:flutter/material.dart';
import 'package:fp_tekber/screens/home_screen.dart';
import 'package:fp_tekber/screens/pickup_screens.dart';
import 'package:fp_tekber/screens/user_settings.dart';
import 'package:fp_tekber/screens/landing_page.dart';
import 'package:fp_tekber/screens/detail_pickup.dart';
import 'package:fp_tekber/screens/landing_pickup.dart';
import 'package:fp_tekber/screens/dashboard.dart';
import 'package:fp_tekber/screens/dashboard_detail.dart';
import 'package:fp_tekber/screens/not_found.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/ajukan-pickup': (context) => const PickupPage(),
  '/profil-saya': (context) => const UserSettings(),
  '/login': (context) => const LoginSignup(),
  '/detail-pickup': (context) => const DetailPickup(),
  '/landing-pickup': (context) => LandingPickup(),
  '/dashboard': (context) => const Dashboard(),
  '/dashboard-detail': (context) => const DashboardDetail(),
  '/not-found': (context) => const NotFoundPage(),
};
