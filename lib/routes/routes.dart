import 'package:flutter/material.dart';
import 'package:buang_bijak/screens/home_screen.dart';
import 'package:buang_bijak/screens/pickup_screens.dart';
import 'package:buang_bijak/screens/user_settings.dart';
import 'package:buang_bijak/screens/landing_page.dart';
import 'package:buang_bijak/screens/detail_pickup.dart';
import 'package:buang_bijak/screens/landing_pickup.dart';
import 'package:buang_bijak/screens/history_pickup.dart';
import 'package:buang_bijak/screens/dashboard.dart';
import 'package:buang_bijak/screens/dashboard_detail.dart';
import 'package:buang_bijak/screens/not_found.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/ajukan-pickup': (context) => const PickupPage(),
  '/profil-saya': (context) => const UserSettings(),
  '/login': (context) => const LoginSignup(),
  '/detail-pickup': (context) => const DetailPickup(),
  '/landing-pickup': (context) => LandingPickup(),
  '/history-pickup': (context) => HistoryPickup(),
  '/dashboard': (context) => const Dashboard(),
  '/dashboard-detail': (context) => const DashboardDetail(),
  '/not-found': (context) => const NotFoundPage(),
};
