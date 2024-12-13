// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:buang_bijak/screens/landing_page.dart';
import 'package:buang_bijak/theme.dart';
import 'package:buang_bijak/widgets/button.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key});

  @override
  UserSettingsState createState() => UserSettingsState();
}

class UserSettingsState extends State<UserSettings> {
  String username = ''; // Initialize username as an empty string

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Fetch user data from Firestore
  Future<void> _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        setState(() {
          username =
              userDoc['username'] ?? 'Pengguna'; // Get username from Firestore
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Arahkan ke home ketika back button ditekan
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        return false; // Menghindari keluar aplikasi
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: black),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Akun Saya',
                  style: bold20.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 32)
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            // Centers the constrained content
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600, // Limit the maximum width to 600px
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // User Info Card
                    Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 10,
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            // Profile Picture
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                '../assets/profile_picture.png',
                              ), // Replace with your asset
                            ),
                            const SizedBox(width: 16),
                            // User Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    username,
                                    style: bold14.copyWith(color: Colors.black),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Jl. Sutorejo Tengah No.10, Dukuh, Kec.\nMulyorejo, Surabaya, Jawa Timur 60113',
                                    style: regular12,
                                  ),
                                ],
                              ),
                            ),
                            // Edit Icon
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.grey),
                              onPressed: () {
                                // Handle edit button press
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Divider(),
                    ),
                    // Account Options
                    ListTile(
                      leading: const Icon(Icons.location_on_outlined),
                      title: Text('Daftar Alamat', style: bold14),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.history),
                      title: Text('Riwayat Redeem', style: bold14),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.receipt_long),
                      title: Text('Riwayat Transaksi', style: bold14),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.payment),
                      title: Text('Metode Pembayaran', style: bold14),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.notifications_outlined),
                      title: Text('Notifikasi', style: bold14),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Divider(),
                    ),
                    // Information Section
                    ListTile(
                      leading: const Icon(Icons.info_outline),
                      title: Text('Panduan Layanan', style: bold14),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.help_outline),
                      title: Text('Pusat Bantuan', style: bold14),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.thumb_up_alt_outlined),
                      title: Text('Ulas Kami', style: bold14),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.privacy_tip_outlined),
                      title: Text('Kebijakan Privasi', style: bold14),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.description_outlined),
                      title: Text('Syarat dan Ketentuan', style: bold14),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    // Logout Button
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Button(
                                onPressed: () async {
                                  // Log out the user
                                  await FirebaseAuth.instance.signOut();

                                  if (mounted) {
                                    // Navigate to login or splash screen after logging out
                                    Navigator.pushReplacement(
                                      // ignore: use_build_context_synchronously
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  }
                                },
                                color: red,
                                text: 'Keluar'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
