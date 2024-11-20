import 'package:flutter/material.dart';
import 'package:fp_tekber/screens/home_screen.dart';
import 'package:fp_tekber/screens/pickup_screens.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/ajukan-pickup': (context) => const PickupPage(),
};
