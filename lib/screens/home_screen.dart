import 'package:flutter/material.dart';
import 'package:buang_bijak/screens/user_screen.dart';
import 'package:buang_bijak/screens/dashboard.dart';

class HomeScreen extends StatelessWidget {
  final bool isAdmin;

  const HomeScreen({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    if (isAdmin) {
      return const Dashboard(); // Render Dashboard jika isAdmin true
    } else {
      return const UserScreen(); // Render UserScreen untuk pengguna non-admin
    }
  }
}
